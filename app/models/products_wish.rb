class ProductsWish < ActiveRecord::Base
  belongs_to :wish
  belongs_to :product
end
