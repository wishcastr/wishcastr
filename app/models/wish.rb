class Wish < ActiveRecord::Base
  has_many :products_wish
  has_many :products, through: :products_wish
  belongs_to :user

  def find_catches
    catches = []
    self.products.each do |product|
      catches << product if product.current_price <= self.threshold_price
    end
    catches
  end

end
