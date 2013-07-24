class ChangeCategoryDefaultVisibleValue < ActiveRecord::Migration
  def up
  	change_column :categories, :visible, :boolean, :default => true
  end

  def down
  end
end
