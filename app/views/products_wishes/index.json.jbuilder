json.array!(@products_wishes) do |products_wish|
  json.extract! products_wish, :id, :wish_id, :product_id
  json.url products_wish_url(products_wish, format: :json)
end
