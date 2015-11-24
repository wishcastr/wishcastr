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
    assert_difference('Wish.count') do
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

  test "should 422 error on create wish" do
    assert_no_difference('Wish.count') do
      post :create, params: {
        wish: {
          user_id: @wish.user_id,
          name: nil,
          query: @wish.query,
          threshold_price: @wish.threshold_price },
        user_id: @user.id,
        access_token: @user.amz_access_token }, format: :json
    end
    assert_response 422
  end

  # test "should 403 error on create wish" do
  #   assert_no_difference('Wish.count') do
  #     post :create, params: {
  #       wish: {
  #         user_id:nil,
  #         name: @wish.name,
  #         query: @wish.query,
  #         threshold_price: @wish.threshold_price},
  #       user_id: @user.id,
  #       access_token: @user.amz_access_token }, format: :json
  #   end
  #   assert_response 403
  # end

  test "should show wish" do
    get :show, params: {user_id: @wish.user_id, id: @wish.id}, format: :json
    assert_response :success
  end

  test "should draft wish" do
    get :draft, params: {user_id: 1}, format: :json
    assert_response :success
  end

  test "should create from draft" do
    post :draft, params: {id:3, user_id: 2}, format: :json
    get :show, params: {id: 3, user_id: 2}, format: :json
    assert_response 404
  end

  # test "draft wish add method" do
  #   post :draft_wish_add, params: {id: 1, user_id: 2}, format: :json
  #   get :draft_wish_add, params: {sku: "123qwe"}, format: :json
  #   assert_response :success
  # end

  test "should update wish" do
    patch :update, params: { id: @wish, wish: {
      category: @wish.category, name: @wish.name,
      query: @wish.query, threshold_price: @wish.threshold_price,
      user_id: @wish.user_id } }, format: :json
    assert_response 403
  end

  test "should error on update wish" do
    patch :update, params: { id: @wish, wish: {
      category: @wish.category, name: nil,
      query: @wish.query, threshold_price: @wish.threshold_price,
      user_id: @wish.user_id },
    user_id: @user.id,
    access_token: @user.amz_access_token
       }, format: :json
    assert_response 422
  end

  test "should destroy wish" do
    assert_difference('Wish.count', -1) do
      delete :destroy, params: { user_id: @wish.user_id, id: @wish.id }, format: :json
    end
    assert_response 200
  end

end
