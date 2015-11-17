require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
    @user = users(:one)
    @product = products(:one)
    @wish = wishes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should return search result" do
    get :index, params: {query: "Nintendo"}
    assert_response :success
  end

  test "should return top wishes" do
    get :top, format: :json
    assert_response :success
  end

  test "should return search results" do
    get :search, format: :json
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

  test "should error on create product" do
    assert_no_difference('Product.count') do
      post :create, params: { product: {
        affiliate_url: @product.affiliate_url,
        brand: @product.brand, description: @product.description,
        image_large: @product.image_large,
        image_thumbnail: @product.image_thumbnail,
        sku: nil, title: @product.title,
        type: @product.type } }, format: :json
    end
    assert_response 422
  end

  test "should show product" do
    get :show, params: { id: @product }
    assert_response :success
  end

  # test "should trigger update" do
  #   get :trigger_update
  #
  #   email = CatchMailer.catch(@user, @product, @wish)
  #   assert_match "Catch!", email.subject
  #   assert_equal ["MyString@you.com"], email.to
  #   assert_equal ["catch@wishcastr.com"], email.from
  #   assert_match "Caught", email.body.encoded
  #
  #   assert_response :success
  # end

  test "should update product" do
    patch :update, params: { id: @product,
      product: { affiliate_url: @product.affiliate_url,
      brand: @product.brand, description: @product.description,
      image_large: @product.image_large,
      image_thumbnail: @product.image_thumbnail, sku: @product.sku,
      title: @product.title, type: @product.type } }, format: :json
    assert_response 200
  end

  test "should error on update product" do
    patch :update, params: { id: @product,
      product: { affiliate_url: @product.affiliate_url,
      brand: @product.brand, description: @product.description,
      image_large: @product.image_large,
      image_thumbnail: @product.image_thumbnail, sku: nil,
      title: @product.title, type: @product.type } }, format: :json
    assert_response 422
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, params: { id: @product }, format: :json
    end
    assert_response 204
  end


end
