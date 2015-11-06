require 'test_helper'

class UsersControllerTest < ActionController::TestCase
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

  test "should create user" do
    assert_difference('User.count') do
      post :create, params: {
        user: { amz_access_token: @user.amz_access_token,
        amz_id: @user.amz_id, amz_raccess_token: @user.amz_raccess_token,
        email: @user.email, name: @user.name,
        postal_code: @user.postal_code } }, format: :json
    end
    assert_response 201
  end

  test "should show user" do
    get :show, params: { id: @user }, format: :json
    assert_response :success
  end

  test "should update user" do
    patch :update, params: {
      id: @user, user: { amz_access_token: @user.amz_access_token,
      amz_id: @user.amz_id, amz_raccess_token: @user.amz_raccess_token,
      email: @user.email, name: @user.name, postal_code: @user.postal_code } }, format: :json
    assert_response 200
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, params: { id: @user }, format: :json
    end
    assert_response 204
  end
end
