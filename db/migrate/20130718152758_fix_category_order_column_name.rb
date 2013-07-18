class FixCategoryOrderColumnName < ActiveRecord::Migration
  def up
  	rename_column :categories, :order, :column_order
  end

  def down
  end
end
