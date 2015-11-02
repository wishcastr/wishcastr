class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :postal_code
      t.string :amz_id
      t.string :amz_access_token
      t.string :amz_raccess_token

      t.timestamps
    end
  end
end
