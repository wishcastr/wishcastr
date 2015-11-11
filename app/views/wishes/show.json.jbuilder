json.id @wish.id
json.user_id @wish.user_id
json.threshold_price @wish.threshold_price
json.category @wish.category
json.query @wish.query
json.name @wish.name
json.saved @wish.saved
json.created_at @wish.created_at
json.updated_at @wish.updated_at
json.products @wish.products do |p|
  json.type p.type
  json.sku p.sku
  json.image_large p.image_large
  json.image_thumbnail p.image_thumbnail
  json.title p.title
  json.brand p.brand
  json.description p.description
  json.affiliate_url p.affiliate_url
end
