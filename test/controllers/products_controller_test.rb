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
      post :create, params: { product: { brand: @product.brand, color: @product.color, edition: @product.edition, eisbn: @product.eisbn, format: @product.format, isbn: @product.isbn, list_price: @product.list_price, model: @product.model, mpn: @product.mpn, part_number: @product.part_number, publication_date: @product.publication_date, publisher: @product.publisher, release_date: @product.release_date, size: @product.size, sku: @product.sku, title: @product.title, upc: @product.upc, wish_id: @product.wish_id } }
    end

    assert_response 201
  end

  test "should show product" do
    get :show, params: { id: @product }
    assert_response :success
  end

  test "should update product" do
    patch :update, params: { id: @product, product: { brand: @product.brand, color: @product.color, edition: @product.edition, eisbn: @product.eisbn, format: @product.format, isbn: @product.isbn, list_price: @product.list_price, model: @product.model, mpn: @product.mpn, part_number: @product.part_number, publication_date: @product.publication_date, publisher: @product.publisher, release_date: @product.release_date, size: @product.size, sku: @product.sku, title: @product.title, upc: @product.upc, wish_id: @product.wish_id } }
    assert_response 200
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, params: { id: @product }
    end

    assert_response 204
  end
end
