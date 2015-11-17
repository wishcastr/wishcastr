class User < ActiveRecord::Base
  validates :amz_id, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  has_many :wishes
  after_create :new_account_email
  has_many :products, through: :wishes


  def draft_wish
    self.wishes.where(saved: false).limit(1).first
  end


  def new_account_email
    CatchMailer.new_account(self).deliver_now unless Rails.env.development?
  end
end
