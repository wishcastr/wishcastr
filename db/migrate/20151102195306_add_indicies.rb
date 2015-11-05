class AddIndicies < ActiveRecord::Migration
  def change
    add_index :products_wishes, :wish_id
    add_index :products_wishes, :product_id
    add_index :price_histories, :product_id
    add_index :wishes, :user_id
  end
end
