class Product < ActiveRecord::Base
  has_many :products_wish
  has_many :wishes, through: :products_wish

  scope :by_wishes, -> { Product.all.sort { |a,b| a.wishes.count <=> b.wishes.count}.reverse }
end
