class AddBalanceToWalletTable < ActiveRecord::Migration
  def change
  	add_column :wallets, :confirmed_balance, :decimal, :default => 0.00
  	add_column :wallets, :pending_balance, :decimal, :default => 0.00
  end
end
