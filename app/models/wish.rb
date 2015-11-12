class Wish < ActiveRecord::Base
  has_many :products_wish
  has_many :products, through: :products_wish
  belongs_to :user
  accepts_nested_attributes_for :products

  def product_duplicate?(sku, type)
    self.products.any? { |p| p.sku == sku && p.type == type }
  end

  def find_catches
    catches = []
    self.products.each do |product|
      catches << product if product.current_price <= self.threshold_price
    end
    catches
  end

end
