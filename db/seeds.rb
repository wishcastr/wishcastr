# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

700.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    postal_code: Faker::Address.postcode,
    amz_id: rand(999999999),
    amz_raccess_token: Faker::Internet.password,
    amz_access_token: rand(999999999)
  )

end

1000.times do
  AmazonProduct.create!(
    brand: Faker::Lorem.word,
    sku: rand(10000000..99999999),
    title: Faker::Lorem.word,
    image_large: "https://placeholdit.imgix.net/~text?txtsize=18&txt=500%C3%97500&w=500&h=500",
    image_thumbnail: "https://placeholdit.imgix.net/~text?txtsize=18&txt=100%C3%97100&w=100&h=100",
    description: Faker::Lorem.sentence,
    affiliate_url: Faker::Internet.url)
end

10.times do
  AmazonProduct.create!(
    brand: Faker::Lorem.word,
    sku: rand(10000000..99999999),
    title: "Jackie Chan Movies",
    image_large: "https://placeholdit.imgix.net/~text?txtsize=18&txt=500%C3%97500&w=500&h=500",
    image_thumbnail: "https://placeholdit.imgix.net/~text?txtsize=18&txt=100%C3%97100&w=100&h=100",
    description: Faker::Lorem.sentence,
    affiliate_url: Faker::Internet.url)
end

products = AmazonProduct.all

1500.times do
  PriceHistory.create!(
    product_id: rand(1..1010),
    currency: "USD",
    price: Faker::Commerce.price,
    date: Faker::Date.between(1.days.ago, Date.today))
end

300.times do
  wish = Wish.create!(
    name: Faker::Commerce.product_name,
    user_id: rand(1..100),
    threshold_price: rand(15.00..500.00).round(2),
    category: Faker::Lorem.word,
    query: Faker::Lorem.word)
  number_of_products = (1..10).to_a.sample
  number_of_products.times do
    ProductsWish.create!(
      wish_id: wish.id,
      product_id: products.sample.id)
  end
end

david = User.create!(
  name: "David Bernheisel",
  email: "david@wishcastr.com",
  postal_code: nil,
  amz_id: "AECXWYJZ5BRUS5KCN35V4O4XPP3Q",
  amz_raccess_token: nil,
  amz_access_token: "Atza|IQEBLjAsAhRgciI1zJB6s8XCOBNNn5uyBvdnjAIUBEskYBNBshgf_0s7-pmGD6BOrgJ8Z0DdFLvHTPdYNErwG-MQ6YBaKvBXf_lRnB07T4FNZEEKMeACm4Ao0ZyfFSPbTF_wITjjHSuk4j87GWkCkj_e4JRCL1spWqRaueYeKe-8ZZoVw0T83gDyTR1HEx75aa0R8sXLDgwCqg-RPTNHQRZLucAzS8Bs04Bcdbf4lvzGDpW0nRpoo5f1jJ_CKNQX8B0Xj9qRZEJTQGbnrfxn-vjLPrOJYyXKX0J4PPEZrSnX4i1QETSp0gwTMR0twHqKf_St3aGCJQe6NcvVBu82vGxrit6vDwb_L59eywkaloR_pkKaYS3iZh1BTi0_R7crdWCnFniOCwm1Wo7jUuFtyqYi8tgpsZnUlLONQ_Khp8YoWgs")

["Nintendo", "Metroid", "Wheelmate Laptop Steering Wheel Desk", "Uranium Ore", "Playmobil Security Check Point", "Laparoscopic Gastric Bypass Kit", "Zombies"].each do |item|
  Wish.create!(
    name: item + "-name",
    user_id: david.id,
    threshold_price: rand(15.00..500.00).round(2),
    category: Faker::Lorem.word,
    query: item + "-query")
end

lacey = User.create!(
  name: "Lacey Rice",
  email: "laceyrice@me.com",
  postal_code: nil,
  amz_id: "AE64PCCIMZPOEGXH2EG2Y7SMGU3Q",
  amz_raccess_token: nil,
  amz_access_token: "Atza|IQEBLjAsAhQdWXfOewzME-Wzzki43wbTRD9_-AIUROdyviFiwnZGf17_LCaqyujNr_4CoqrdcYuB6vNQ4UFH7DUdCeMgMlGX5sZ2P4YDsbnBV3rAsS6ae1l8JrWb3O-2xqXltfMkOMjzi-pT84V2P0bs4wEwzT5ew3Pg_F1WkHovDdpj5gj2KnScwp7iRYLH4rVN3MEAqpLUm2d_g9_fR12B6b9hCjr6S1QF69IWjy0c8ABIxUDP1i6DvZjvV3aEp7cXtO6ItV9JA8nXOBpI0ZoJ1W7m71AHLhRLRw-wFGyvSk_IA9jnNh76dXh1eUjKwr2NMQcAz2D80kwXAboMGzV3NiSeLIJHBSrByiG3ANvkd6GEgpcJzmA-OdT5mL9cAr5mvaWicK_Erve8ULONd29pKQ")

["Potato", "Interstellar", "Star Wars Box Set", "Iron Man Hoodie", "Doctor Who Ice Tray", "Laptop bag", "Javascript book"].each do |item|
  Wish.create!(
    name: item + "-name",
    user_id: lacey.id,
    threshold_price: rand(15.00..500.00).round(2),
    category: Faker::Lorem.word,
    query: item + "-query")
end
