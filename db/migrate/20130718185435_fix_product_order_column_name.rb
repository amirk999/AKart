class FixProductOrderColumnName < ActiveRecord::Migration
  def up
  	rename_column :variant_categories, :order, :variant_category_order
  end

  def down
  end
end
