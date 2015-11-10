class User < ActiveRecord::Base
  validates :amz_id, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  has_many :wishes
  has_many :products, through: :wishes
  

  def draft_wish
    self.wishes.where(saved: false).limit(1)
  end

end
