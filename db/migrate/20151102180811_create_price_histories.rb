class CreatePriceHistories < ActiveRecord::Migration
  def change
    create_table :price_histories do |t|
      t.integer :product_id
      t.string :currency
      t.decimal :price
      t.datetime :date

      t.timestamps
    end
  end
end
