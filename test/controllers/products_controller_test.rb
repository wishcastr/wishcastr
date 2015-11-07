require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, params: { product: {
        affiliate_url: @product.affiliate_url,
        brand: @product.brand, description: @product.description,
        image_large: @product.image_large,
        image_thumbnail: @product.image_thumbnail,
        sku: @product.sku, title: @product.title,
        type: @product.type } }, format: :json
    end
    assert_response 201
  end

  test "should show product" do
    get :show, params: { id: @product }
    assert_response :success
  end

  test "should update product" do
    patch :update, params: { id: @product,
      product: { affiliate_url: @product.affiliate_url,
      brand: @product.brand, description: @product.description,
      image_large: @product.image_large,
      image_thumbnail: @product.image_thumbnail, sku: @product.sku,
      title: @product.title, type: @product.type } }, format: :json
    assert_response 200
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, params: { id: @product }, format: :json
    end
    assert_response 204
  end
end
