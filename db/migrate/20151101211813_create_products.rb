class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.text :brand
      t.text :color
      t.text :edition
      t.text :eisbn
      t.text :format
      t.text :isbn
      t.text :list_price
      t.text :model
      t.text :mpn
      t.text :part_number
      t.text :publication_date
      t.text :release_date
      t.text :publisher
      t.text :sku
      t.text :title
      t.text :upc
      t.text :size
      t.integer :wish_id

      t.timestamps
    end
  end
end
