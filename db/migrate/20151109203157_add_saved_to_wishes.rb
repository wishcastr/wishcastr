class AddSavedToWishes < ActiveRecord::Migration
  def change
    add_column :wishes, :saved, :boolean, default: false
  end
end
