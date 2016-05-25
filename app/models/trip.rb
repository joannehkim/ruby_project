class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :as => :commentable
  has_many :likes, :as => :likeable
  has_many :places
  has_attached_file :picture
  validates_attachment_content_type :picture, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	def self.most_liked destination
       self.find_by_sql(["SELECT trips.description, trips.id, COUNT(trips.id) as u_likes, users.first_name, trips.start_date, trips.end_date FROM trips JOIN likes ON (trips.id = likes.likeable_id and likes.likeable_type = 'Trip') JOIN users ON users.id = trips.user_id WHERE trips.destination = ? GROUP BY trips.id, users.id ORDER BY u_likes DESC LIMIT 3", destination])
   end
# SELECT trips.id, COUNT(trips.id) as likes, users.first_name, trips.start_date FROM trips JOIN likes ON (trips.id = likes.likeable_id and likes.likeable_type = 'Trip') JOIN users ON users.id = trips.user_id WHERE trips.destination = 'Seattle, WA' GROUP BY trips.id, users.id;
end
# Trip.find_by_sql("SELECT trips.id, COUNT(trips.id) as u_likes, users.first_name, trips.start_date FROM trips JOIN likes ON (trips.id = likes.likeable_id and likes.likeable_type = 'Trip') JOIN users ON users.id = trips.user_id WHERE trips.destination = 'Seattle, WA' GROUP BY trips.id, users.id ORDER BY u_likes DESC LIMIT 3")