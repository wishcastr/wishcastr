class User < ActiveRecord::Base
  validates :amz_id, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  has_many :wishes

  def unsaved_wish
    find a wish attached to user if it returns true then show wish else create a
    (wish wish controller action)

    user_wish = Wish.find_by_user(user)
    if user_wish

  end

end
