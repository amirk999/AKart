class CreateVariantCategories < ActiveRecord::Migration
  def change
    create_table :variant_categories do |t|
      t.string :name
      t.text :description
      t.boolean :visible
      t.integer :order
      t.integer :product_id

      t.timestamps
    end
  end
end
