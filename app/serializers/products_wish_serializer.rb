class ProductsWishSerializer < ActiveModel::Serializer
  attributes :id, :wish_id, :product_id
end
