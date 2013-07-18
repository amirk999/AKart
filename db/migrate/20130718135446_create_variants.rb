class CreateVariants < ActiveRecord::Migration
  def change
    create_table :variants do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.boolean :visible
      t.boolean :default
      t.integer :variant_category_id

      t.timestamps
    end
  end
end
