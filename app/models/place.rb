class Place < ActiveRecord::Base
  belongs_to :trip
  has_many :comments, :as => :commentable
end
