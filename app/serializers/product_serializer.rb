class ProductSerializer < ActiveModel::Serializer
  attributes :id, :brand, :color, :edition, :eisbn, :format, :isbn, :list_price, :model, :mpn, :part_number, :publication_date, :release_date, :publisher, :sku, :title, :upc, :size, :wish_id
end
