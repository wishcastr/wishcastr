class WishSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :threshold_price, :category, :query, :name
end
