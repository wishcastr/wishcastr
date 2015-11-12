class AddNotifiedToWishes < ActiveRecord::Migration
  def change
    add_column :wishes, :notified, :boolean, default: false
  end
end
