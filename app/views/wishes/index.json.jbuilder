json.array!(@wishes) do |wish|
  json.extract! wish, :id, :user_id, :threshold_price, :category
  json.url wish_url(wish, format: :json)
end
