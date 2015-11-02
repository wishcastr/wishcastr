class ChangeThresholdPrice < ActiveRecord::Migration
  def change
    change_column :wishes, :threshold_price
  end
end
