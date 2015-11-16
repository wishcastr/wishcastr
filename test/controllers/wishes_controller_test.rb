require 'test_helper'

class WishesControllerTest < ActionController::TestCase
  setup do
    @wish = wishes(:one)
    @user = users(:one)
  end

  test "should get index" do
    get :index, params: { user_id: @user.id, access_token: @user.amz_access_token}
    assert_response :success
  end

  test "should create wish" do
    assert_difference('Wish.count', 1) do
      post :create, params: {
        wish: {
          user_id: @wish.user_id,
          name: @wish.name,
          query: @wish.query,
          threshold_price: @wish.threshold_price },
        user_id: @user.id,
        access_token: @user.amz_access_token }, format: :json
    end
    assert_response 201
  end

  test "should show wish" do
    get :show, params: {user_id: @wish.user_id, id: @wish.id}, format: :json
    assert_response :success
  end

  test "should update wish" do
    patch :update, params: { id: @wish, wish: {
      category: @wish.category, name: @wish.name,
      query: @wish.query, threshold_price: @wish.threshold_price,
      user_id: @wish.user_id } }, format: :json
    assert_response 403
  end

  test "should destroy wish" do
    assert_difference('Wish.count', -1) do
      delete :destroy, params: { user_id: @wish.user_id, id: @wish.id }, format: :json
    end
    assert_response 200
  end
end
