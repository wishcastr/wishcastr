require 'test_helper'

class UsersTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

    test 'user can login' do
    get "/users/1.json"
    assert_template :show

    # post "/users/"
    # assert_template :show
  end
end
