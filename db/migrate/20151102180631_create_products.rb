class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :type
      t.string :sku
      t.string :image_large
      t.string :image_thumbnail
      t.string :title
      t.string :brand
      t.text :description
      t.string :affiliate_url

      t.timestamps
    end
  end
end
