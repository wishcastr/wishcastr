class Product < ActiveRecord::Base
  has_many :products_wish
  has_many :wishes, through: :products_wish
  has_many :price_histories

  # def self.by_wishes
  #   pw = ProductsWish.all
  #   top_25_ids = pw.where('SELECT * from product_wishes as pw COUNT(wish_id) GROUP BY product_id ORDER BY COUNT(wish_id) LIMIT 25')
  #   Product.find(top_25_ids)
  # end

  def self.by_wishes
    Product.select("products.*, COUNT(products_wishes.id) as wishes_count")
     .joins("LEFT OUTER JOIN products_wishes ON products.id = products_wishes.product_id")
     .group("products.id")
     .order("wishes_count DESC")
  end

  def self.top_25_by_wish
    self.by_wishes.limit(25)
  end

  def current_price
    a = price_histories.order(:date).limit(1).first
    a ? a.price : nil
  end
end
