class CreateWallets < ActiveRecord::Migration
  def change
    create_table :wallets do |t|
      t.string :address
      t.string :private_key
      t.integer :profile_id
      t.string :currency_type_id

      t.timestamps
    end
  end
end
