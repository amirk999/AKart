class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :category_id
      t.integer :product_slider_id
      t.integer :product_main_id
      t.integer :product_additional_id

      t.timestamps
    end
  end
end
