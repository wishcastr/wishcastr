# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# 100.times do
#   User.create!(name: Faker::Name.name, email: Faker::Internet.email, password_digest: Faker::Internet.password(6), zipcode: Faker::Address.zip)
# end
700.times do
  User.create!(name: Faker::Name.name, email: Faker::Internet.email, postal_code: Faker::Address.postcode)
end


1000.times do
  AmazonProduct.create!(brand: Faker::Lorem.word, sku: rand(10000000..99999999), title: Faker::Lorem.word,
  image_large: "http://www.lorempixel.com/g/150/150",
  image_thumbnail: "http://www.lorempixel.com/g/50/50",
  description: Faker::Lorem.sentence, affiliate_url: Faker::Internet.url)
end

10.times do
  AmazonProduct.create!(brand: Faker::Lorem.word, sku: rand(10000000..99999999), title: "Jackie Chan Movies",
  image_large: "http://www.lorempixel.com/g/150/150",
  image_thumbnail: "http://www.lorempixel.com/g/50/50",
  description: Faker::Lorem.sentence, affiliate_url: Faker::Internet.url)
end

products = AmazonProduct.all


300.times do
  wish = Wish.create!(name: Faker::Commerce.product_name, user_id: rand(1..100),
  threshold_price: rand(15.00..500.00).round(2), category: Faker::Lorem.word, query: Faker::Lorem.word)
  number_of_products = (1..10).to_a.sample
  number_of_products.times do
    ProductsWish.create!(wish_id: wish.id, product_id: products.sample.id)
  end
end


# PriceHistory.create!()
