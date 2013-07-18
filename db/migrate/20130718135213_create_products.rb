class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :sku
      t.text :description
      t.decimal :price
      t.boolean :visible
      t.integer :category_id

      t.timestamps
    end
  end
end
