json.array!(@products) do |product|
  json.extract! product, :id, :brand, :color, :edition, :eisbn, :format, :isbn, :list_price, :model, :mpn, :part_number, :publication_date, :release_date, :publisher, :sku, :title, :upc, :size, :wish_id
  json.url product_url(product, format: :json)
end
