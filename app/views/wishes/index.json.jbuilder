json.array!(@wishes) do |wish|
  json.extract! wish, :id, :user_id, :threshold_price, :category, :query, :name
  json.url wish_url(wish, format: :json)
end
