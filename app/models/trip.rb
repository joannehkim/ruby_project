class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :as => :commentable
  has_many :likes, :as => :likeable
  has_many :places

	def self.most_liked destination
		self.find_by_sql("SELECT trips.id, COUNT(trips.id) as likes, users.first_name, trips.start_date FROM trips JOIN likes ON (trips.id = likes.likeable_id and likes.likeable_type = 'Trip') JOIN users ON users.id = trips.user_id WHERE trips.destination = ? GROUP BY trips.id, users.id", [destination])
	end
# SELECT trips.id, COUNT(trips.id) as likes, users.first_name, trips.start_date FROM trips JOIN likes ON (trips.id = likes.likeable_id and likes.likeable_type = 'Trip') JOIN users ON users.id = trips.user_id WHERE trips.destination = 'Seattle, WA' GROUP BY trips.id, users.id;
end
