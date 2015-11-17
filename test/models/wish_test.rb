require 'test_helper'

class WishTest < ActiveSupport::TestCase

  test "product duplicate method" do
    wish = Wish.create(id: 1, user_id: 1, category: "toys")
    product = Product.create!(id:1, sku: "123qwe", title: "Star Wars")
    wish.product_duplicate?("123qwe", Wish)
    assert true
  end

  test "find catches method" do
    product = Product.create!(id: 1, sku: "123qwe", title: "Star Wars")
    phistory = PriceHistory.create!(id: 1, product_id: 1, price: 22)
    wish = Wish.create(id: 1, user_id: 1, category: "toys", threshold_price: 20)

    wish.find_catches
    assert product
  end

end
