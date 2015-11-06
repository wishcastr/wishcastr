require 'test_helper'

class WishesControllerTest < ActionController::TestCase
  setup do
    @wish = wishes(:one)
    @user = users(:one)
    @request.headers["x-wishcastr-access-token"] = @user.amz_access_token
    @request.headers["x-wishcastr-user-id"] = @user.id
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should create wish" do
    assert_difference('Wish.count') do
      post :create, params: { wish: { category: @wish.category, name: @wish.name, query: @wish.query, threshold_price: @wish.threshold_price, user_id: @wish.user_id } }
    end

    assert_response 201
  end

  test "should show wish" do
    get :show, params: { id: @wish }
    assert_response :success
  end

  test "should update wish" do
    patch :update, params: { id: @wish, wish: { category: @wish.category, name: @wish.name, query: @wish.query, threshold_price: @wish.threshold_price, user_id: @wish.user_id } }
    assert_response 200
  end

  test "should destroy wish" do
    assert_difference('Wish.count', -1) do
      delete :destroy, params: { id: @wish }
    end
    assert_response 204
  end
end
