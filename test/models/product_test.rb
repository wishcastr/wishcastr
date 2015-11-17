require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "NotImplementedError for search" do
    assert_raise(NotImplementedError) do
      Product.search
    end
  end

  test "NotImplementedError for item_lookup" do
    assert_raise(NotImplementedError) do
      Product.item_lookup
    end
  end

end
