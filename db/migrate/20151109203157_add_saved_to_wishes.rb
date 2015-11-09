class AddSavedToWishes < ActiveRecord::Migration
  def change
    add_column :wishes, :saved, :boolean
    change_column :saved, :default => false
  end
end
