# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
100.times do
  User.create!(name: Faker::Name.name, email: Faker::Internet.email, password_digest: Faker::Internet.password(6), zipcode: Faker::Address.zip)
end

300.times do
  Wish.create!(user_id: rand(1..100), threshold_price: rand(15.00..400.00).round(2), category: Faker::Lorem.word)
end

1000.times do
  Product.create!(brand: Faker::Lorem.word, color:Faker::Commerce.color, edition: Faker::Lorem.word, eisbn: Faker::Code.isbn,
  isbn: Faker::Code.isbn, format: Faker::Lorem.word, list_price: Faker::Commerce.price, model: Faker::Lorem.word, mpn: Faker::Number.number(5),
  part_number: rand(1000000..9999999), publication_date: Faker::Date.between(2.days.ago, Date.today),
  release_date: Faker::Date.between(4.days.ago, Date.today), publisher: Faker::Book.publisher,
  sku: rand(10000000..99999999), title: Faker::Lorem.word, upc: rand(1000000..9999999), size: rand(1..55), wish_id: rand(1..300))
end
