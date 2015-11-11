class Wish < ActiveRecord::Base
  has_many :products_wish
  has_many :products, through: :products_wish
  belongs_to :user

  def compare
    # @product = wish.products
    # self.each do |w|
  end

  def check_products
    product = self.products
    self.each do |w|
      w.product

    loop through wishes, loop through products attached to that wish, then compare
    prices of that of the same sku and if any of the threshold prices are met then
    trigger mailer. also replace old prices_history with most current prices_history

  end

end
