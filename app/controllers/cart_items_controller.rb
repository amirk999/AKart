class CartItemsController < ApplicationController
	
	authorize_resource :class => false

	def create
		@cart = current_cart

		#validate that the product exists
		product = Product.find(params[:product_id])

		#if there are variants, always create a new line
		if !params[:variant].nil? 
			@cart_item = @cart.cart_items.build(:product_id => product.id)
			@cart_item.quantity = params[:cart_item][:quantity]

			params[:variant].each do |key, value|
				variant = Variant.find(value)
				@cart_item.variants << variant
			end
		else #if there aren't any variants, first try to see if the item is already in the cart
			@cart_item = @cart.cart_items.where(:product_id => params[:product_id]).first
			if @cart_item.nil?
				@cart_item = @cart.cart_items.build(:product_id => product.id)
				@cart_item.quantity = params[:cart_item][:quantity]
			else
				@cart_item.quantity += params[:cart_item][:quantity].to_i
			end
		end

		@cart_item.calculateTotal
		@cart.updateTotal

		#save the cart item in the database
		@cart_item.save

		flash[:success] = 'Successfully added item to cart'
		redirect_to cart_path
	end

	def destroy
		@cart = current_cart
		@cart_item = CartItem.find(params[:id])
		@cart_item.destroy
		flash[:success] = "Successfully removed the item from your cart"
		@cart.updateTotal
		redirect_to cart_path
	end

end