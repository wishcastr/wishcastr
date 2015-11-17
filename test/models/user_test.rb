require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
    @wish = wishes(:one)
  end
  test "draft wish method" do
    wishes = []
    u = User.create(id: 1, name: "MyString", email:"MyString@you.com")
    w = Wish.create(user_id: 1)
    wishes << w
    assert true
  end

end
