class CreateProductsWishes < ActiveRecord::Migration
  def change
    create_table :products_wishes do |t|
      t.integer :wish_id
      t.integer :product_id

      t.timestamps
    end
  end
end
