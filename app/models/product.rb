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
    Product.limit(25)
  end

  def current_price
    a = price_histories.order(:date).limit(1).first
    a ? a.price : "untracked"
  end

end
