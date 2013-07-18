class FixCategoryOrderColumnName2 < ActiveRecord::Migration
  def up
  	rename_column :categories, :column_order, :category_order
  end

  def down
  end
end
