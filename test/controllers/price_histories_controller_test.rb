require 'test_helper'

class PriceHistoriesControllerTest < ActionController::TestCase
  setup do
    @price_history = price_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should create price_history" do
    assert_difference('PriceHistory.count') do
      post :create, params: {
        price_history: { currency: @price_history.currency,
        date: @price_history.date, price: @price_history.price,
        product_id: @price_history.product_id } }, format: :json
    end
    assert_response 201
  end

  test "should error on create price_history" do
    assert_no_difference('PriceHistory.count') do
      post :create, params: { id: @price_history.id,
        price_history: { currency: @price_history.currency,
        date: @price_history.date, price: @price_history.price,
        product_id: nil } }, format: :json
    end
    assert_response 422
  end

  test "should error on update price history" do
    patch :update, params: {id: @price_history.id,
      price_history: { currency: @price_history.currency,
      date: @price_history.date, price: @price_history.price,
      product_id: nil} }, format: :json
    assert_response 422
  end

  test "should show price_history" do
    get :show, params: { id: @price_history }
    assert_response :success
  end

  test "should update price_history" do
    patch :update, params: { id: @price_history, price_history: {
      currency: @price_history.currency, date: @price_history.date,
      price: @price_history.price,
      product_id: @price_history.product_id } }, format: :json
    assert_response 200
  end

  test "should destroy price_history" do
    assert_difference('PriceHistory.count', -1) do
      delete :destroy, params: { id: @price_history }, format: :json
    end
    assert_response 204
  end
end
