class CartsController < ApplicationController
	def show
		@cart = current_cart
	end

	def update
		@cart = current_cart
		if !params[:cart_item].nil? 
			params[:cart_item].each do |key, value|
				cart_item = CartItem.find(key)
				cart_item.quantity = value
				cart_item.calculateTotal
				cart_item.save
			end
		end
		@cart.updateTotal
		flash[:success] = "Cart updated successfully"
		redirect_to cart_path
	end
end