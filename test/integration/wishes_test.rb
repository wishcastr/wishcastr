require 'test_helper'

class WishesTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @wishes = wishes(:one)
  end

    test 'show user wish' do
      get "/wishes/1.json"
      assert_template "[]"
    end

    test 'user can update wish' do
      patch "/wishes/1.json", params: {user_id: 1, threshold_price: 24,
         category: "Game", query: "Halo", name: "Halo:Reach"}
      assert_template :show
    end

end
