class User < ActiveRecord::Base
  has_many :wishes
  validates :amz_id, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true

end
