class AddVisibleDefaultToVariants < ActiveRecord::Migration
  def change
  	change_column :variants, :visible, :boolean, :default => true
  	change_column :variant_categories, :visible, :boolean, :default => true
  end
end
