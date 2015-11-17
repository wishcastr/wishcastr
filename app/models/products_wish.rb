class ProductsWish < ActiveRecord::Base
  belongs_to :wish
  belongs_to :product
  validates :product_id, presence: true
end
