class User < ActiveRecord::Base
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  has_many :trips
  has_many :places, :through => :trips
  validates :first_name, :last_name, presence: true, length: { in: 2..20 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  has_attached_file :avatar
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
