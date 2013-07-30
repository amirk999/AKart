class CreateCartItemVariantJoinTable < ActiveRecord::Migration
  def up
  	create_table :cart_items_variants, id: false do |t|
			t.integer :cart_item_id
  		t.integer :variant_id
  	end
  end

  def down
  	drop_table :cart_items_variants
  end
end
