class Picture < ActiveRecord::Base
  belongs_to :place
  has_many :comments, :as => :commentable
  has_attached_file :picture
  validates_attachment_content_type :picture, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
