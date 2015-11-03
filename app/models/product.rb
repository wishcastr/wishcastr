class Product < ActiveRecord::Base
  has_many :wishes, through: :products_wish
  has_many :products_wishes

  def self.by_wishes
    Product.select("products.*, COUNT(products_wishes.id) as wishes_count")
     .joins("LEFT OUTER JOIN products_wishes ON products.id = products_wishes.product_id")
     .group("products.id")
     .order("wishes_count DESC")
  end

  def self.top_25_by_wish
    self.by_wishes.limit(25)
  end

end
