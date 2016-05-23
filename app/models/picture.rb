class Picture < ActiveRecord::Base
  belongs_to :place
  has_many :comments, :as => :commentable
end
