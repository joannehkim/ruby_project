class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :as => :commentable, dependent: :destroy
  has_many :likes, :as => :likeable, dependent: :destroy
  has_many :places, dependent: :destroy

  validates :destination, :description, :start_date, :end_date, presence: true

  before_save do
  	self.destination.split.map(&:capitalize).join(' ')
  end
  	
  has_attached_file :picture
  validates_attachment_content_type :picture, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	def self.most_liked destination
	   self.find_by_sql(["SELECT trips.description, trips.id, COUNT(trips.id) as u_likes, users.first_name, trips.start_date, trips.end_date, trips.picture_file_name, trips.picture_content_type, trips.picture_file_size FROM trips JOIN likes ON (trips.id = likes.likeable_id and likes.likeable_type = 'Trip') JOIN users ON users.id = trips.user_id WHERE trips.destination = ? GROUP BY trips.id, users.id ORDER BY u_likes DESC LIMIT 3", [destination]])
	end
end