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

300.times do
  Wish.create!(name: Faker::Commerce.product_name, user_id: rand(1..100), threshold_price: rand(15.00..500.00).round(2), category: Faker::Lorem.word, query: Faker::Lorem.word)
end

800.times do
  Product.create!(brand: Faker::Lorem.word, sku: rand(10000000..99999999), title: Faker::Lorem.word, wish_id: rand(1..300),
  image_large: Faker::Placeholdit.image("150x150", 'jpg', 'ffffff', '000', 'Some Product'),
  image_thumbnail: Faker::Placeholdit.image("50x50", 'jpg', 'eeeeee', '000', 'Thumbnail'),
  description: Faker::Lorem.sentence, affiliate_url: Faker::Internet.url)
end

10.times do
  Product.create!(brand: Faker::Lorem.word, sku: rand(10000000..99999999), title: "Jacki Chan Movies", wish_id: rand(1..300),
  image_large: Faker::Placeholdit.image("150x150", 'jpg', 'ffffff', '000', 'Some Product'),
  image_thumbnail: Faker::Placeholdit.image("50x50", 'jpg', 'eeeeee', '000', 'Thumbnail'),
  description: Faker::Lorem.sentence, affiliate_url: Faker::Internet.url)
end


# PriceHistory.create!()
# ProductWish.create!(wish_id: rand(1..300), product_id: rand(1..800))
