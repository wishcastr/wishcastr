class User < ActiveRecord::Base
  validates :amz_id, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  has_many :wishes

end
