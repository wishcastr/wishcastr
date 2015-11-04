class Product < ActiveRecord::Base
  has_many :wishes, through: :products_wish
  has_many :products_wishes
  has_many :price_histories

  def self.by_wishes(how_many = nil)
    products = Product.select("products.*, COUNT(products_wishes.id) as wishes_count")
      .joins("LEFT OUTER JOIN products_wishes ON products.id = products_wishes.product_id")
      .group("products.id")
      .order("wishes_count DESC")
    how_many ? products.limit(how_many) : products
  end

  def current_price
    a = price_histories.order(:date).limit(1).first
    a ? a.price : nil
  end

  def self.search
    raise NotImplementedError, 'Need to Implement on subClass'
  end
end
