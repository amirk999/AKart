class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :order
      t.boolean :visible

      t.timestamps
    end
  end
end
