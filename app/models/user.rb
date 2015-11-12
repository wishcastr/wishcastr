class User < ActiveRecord::Base
  validates :amz_id, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  has_many :wishes
  after_create :new_account_email


  def new_account_email
    CatchMailer.new_account(self).deliver_now
  end
end
