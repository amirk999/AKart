class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
    	t.decimal :price
      t.integer :product_id
      t.integer :cart_id

      t.timestamps
    end
  end
end