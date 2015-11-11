json.array!(@wishes) do |wish|
  json.extract! wish, :id, :user_id, :threshold_price, :category, :query, :name, :saved
  json.products wish.products, :type, :sku, :image_large, :image_thumbnail, :title, :brand, :description, :affiliate_url
end
