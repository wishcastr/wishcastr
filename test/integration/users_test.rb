require 'test_helper'

class UsersTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

    test 'user can login' do
      get "/users/1.json"
      assert_template :show
    end

    test 'user can update' do
      patch "/users/1.json", params: {user: {name: "Da-Me", email: "dame@wishcastr.com",
        postal_code:"72727", amz_id:"AWED123", amz_access_token: "123DE",
        amz_raccess_token:"Wat"}}
      assert_template :show
    end

end
