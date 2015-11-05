class CreateWishes < ActiveRecord::Migration
  def change
    create_table :wishes do |t|
      t.integer :user_id
      t.decimal :threshold_price
      t.string :category
      t.string :query
      t.string :name

      t.timestamps
    end
  end
end
