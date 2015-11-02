class CreateWishes < ActiveRecord::Migration
  def change
    create_table :wishes do |t|
      t.integer :user_id
      t.float :threshold_price
      t.string :category

      t.timestamps
    end
  end
end
