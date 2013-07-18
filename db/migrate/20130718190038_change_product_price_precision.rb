class ChangeProductPricePrecision < ActiveRecord::Migration
  def up
  	change_column :products, :price, :decimal, precision: 12, scale: 2
  end

  def down
  end
end
