class Product < ActiveRecord::Base
  has_many :wishes, through: :products_wishes
  has_many :products_wishes
  has_many :price_histories
  validates :sku, presence: true

  def self.by_wishes(how_many = nil)
    products = Product.select("products.*, COUNT(products_wishes.id) as wishes_count")
      .joins("LEFT OUTER JOIN products_wishes ON products.id = products_wishes.product_id")
      .group("products.id")
      .order("wishes_count DESC")
    how_many ? products.limit(how_many) : products
  end

  def current_price
    a = price_histories.order(created_at: :desc).limit(1).first
    a ? a.price : "Not Available"
  end

  def self.search
    raise NotImplementedError, 'Need to Implement on subClass'
  end

  def self.item_lookup
    raise NotImplementedError, 'Need to Implement on subClass'
  end

  def self.update_prices
    Product.all.each do |product|
      updated_product = product.class.item_lookup(product.sku)
      if updated_product[:sku] == product.sku
        PriceHistory.create(product_id: product.id, price: updated_product[:current_price], date: DateTime.now())
        # product.write_d3_table
      else
        logger.debug("How did this happen? Amazon you dumb")
      end
      sleep 1.0 if product.class == AmazonProduct
    end
  end

  # def write_d3_table
  #   File.open(Rails.root.join("public/data/#{type}-#{sku}.tsv"), 'w') do |f|
  #     price_histories.each do |ph|
  #       f.write "#{ph.date}\t#{ph.price}\n"
  #     end
  #   end
  # end
end
