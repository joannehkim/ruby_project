class Place < ActiveRecord::Base
  belongs_to :trip
  has_many :comments, :as => :commentable, dependent: :destroy
  has_many :costs, dependent: :destroy
  has_many :likes, :as => :likeable, dependent: :destroy
  has_many :pictures, dependent: :destroy
end
