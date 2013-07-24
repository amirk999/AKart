class ProductsController < ApplicationController
	load_and_authorize_resource
	
	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		if @product.update_attributes(params[:product])
			redirect_to @product
			flash[:success] = "Successfully saved product information"
		else
			render 'edit'
			flash[:fail] = "Could not save the product information"
		end
	end

	def new
		@product = Product.new
		@product.variant_categories.build
		@product.variant_categories.first.variants.build
	end

	def create
		@product = Product.new(params[:product])

		if @product.save
			flash[:success] = "Product created successfully"
			redirect_to @product
		else
			render 'new'
		end
	end

	def destroy
		@product = Product.find(params[:id])
		@category = @product.category
		@product.destroy
		flash[:success] = "Product successfully deleted"
		redirect_to @category
	end
end