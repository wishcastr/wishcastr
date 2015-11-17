require 'test_helper'

class WishesTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @wish = wishes(:one)
  end

  test 'show user wish' do
    get "/wishes/" + @wish.id.to_s, params: {
      user_id: @user.id,
      access_token: @user.amz_access_token
    }
    assert_template :show
  end

  test 'user can update wish' do
    patch "/wishes/" + @user.wishes.first.id.to_s, params: {
      wish: {
        threshold_price: 24,
        category: "Game",
        query: "Halo",
        name: "Halo:Reach"
      },
      user_id: @user.id,
      access_token: @user.amz_access_token
    }
    assert_template :show
  end

end
