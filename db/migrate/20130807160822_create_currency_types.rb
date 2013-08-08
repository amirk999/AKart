class CreateCurrencyTypes < ActiveRecord::Migration
  def change
    create_table :currency_types do |t|
      t.string :name
      t.string :rpcuser
      t.string :rpcpass
      t.string :rpchost
      t.integer :rpcport

      t.timestamps
    end
  end
end
