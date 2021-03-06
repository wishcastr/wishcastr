require 'test_helper'

class ProductsWishesControllerTest < ActionController::TestCase
  setup do
    @products_wish = products_wishes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should create products_wish" do
    assert_difference('ProductsWish.count') do
      post :create, params: {
        products_wish: {
          product_id: @products_wish.product_id,
          wish_id: @products_wish.wish_id
        }
      }, format: :json
    end
    assert_response 201
  end

  test "should error on create products_wish" do
    assert_no_difference('ProductsWish.count') do
      post :create, params: {
        products_wish: {
          product_id: nil,
          wish_id: @products_wish.wish_id
        }
      }, format: :json
    end
    assert_response 422
  end

  test "should show products_wish" do
    get :show, params: { id: @products_wish }, format: :json
    assert_response :success
  end

  test "should update products_wish" do
    patch :update, params: { id: @products_wish,
      products_wish: { product_id: @products_wish.product_id,
      wish_id: @products_wish.wish_id } }, format: :json
    assert_response 200
  end

  test "should error on update products_wish" do
    patch :update, params: { id: @products_wish,
      products_wish: { product_id: nil,
      wish_id: @products_wish.wish_id } }, format: :json
    assert_response 422
  end

  test "should destroy products_wish" do
    assert_difference('ProductsWish.count', -1) do
      delete :destroy, params: { id: @products_wish }, format: :json
    end
    assert_response 204
  end
end
