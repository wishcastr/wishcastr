class Wish < ActiveRecord::Base
  has_many :products_wish
  has_many :products, through: :products_wish
  belongs_to :user

  def check_products
    products
    # self.each do |w|
    #   w.product

    # loop through wishes, loop through products attached to that wish, then compare
    # prices of that of the same sku and if any of the threshold prices are met then
    # trigger mailer. also replace old prices_history with most current prices_history

  def find_catches
    catches = []
    self.products.each do |p|
      catches << p if p.current_price <= self.threshold_price
    end
    catches
  end

end
