class Product < ActiveRecord::Base
  has_many :products_wish
  has_many :wishes, through: :products_wish
end
