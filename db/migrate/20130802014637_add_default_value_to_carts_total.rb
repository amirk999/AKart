class AddDefaultValueToCartsTotal < ActiveRecord::Migration
  def change
  	change_column :carts, :total, :decimal, :precision => 20, :scale => 4, :default => 0.0, :null => false
  end
end
