class ProductSerializer < ActiveModel::Serializer
  attributes :id, :type, :sku, :image_large, :image_thumbnail, :title, :brand, :description, :affiliate_url
end
