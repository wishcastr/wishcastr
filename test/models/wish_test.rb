require 'test_helper'

class WishTest < ActiveSupport::TestCase

  test "product duplicate method" do
    wish = Wish.create(id: 1, user_id: 1, category: "toys")
    product = Product.create!(id:1, sku: "123qwe", title: "Star Wars")
    wish.product_duplicate?("123qwe", Wish)

    assert true
  end

end
