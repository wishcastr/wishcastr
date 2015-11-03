json.array!(@products) do |product|
  json.extract! product, :id, :type, :sku, :image_large, :image_thumbnail, :title, :brand, :current_price, :description, :affiliate_url
end
