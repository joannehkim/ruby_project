class Cost < ActiveRecord::Base
  belongs_to :place
  has_many :comments, :as => :commentable, dependent: :destroy
end
