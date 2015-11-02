class ChangeThresholdPrice < ActiveRecord::Migration
  def change
    change_column :wishes, :threshold_price, :decimal, precision: 2, scale: 10
  end
end
