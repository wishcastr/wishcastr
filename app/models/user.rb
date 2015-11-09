class User < ActiveRecord::Base
  validates :amz_id, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  has_many :wishes

  def draft
    find a wish attached to user
    if it returns true then show wish
    else create a wish 

    uw = Wish.find_by_user(user)
  end

end
