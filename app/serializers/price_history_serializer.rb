class PriceHistorySerializer < ActiveModel::Serializer
  attributes :id, :product_id, :currency, :price, :date
end
