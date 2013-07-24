class CategoriesController < ApplicationController
	load_and_authorize_resource

	def index
		@categories = Category.all
	end

	def show
		@category = Category.find(params[:id])
		@products = @category.products
	end

	def edit
		@category = Category.find(params[:id])
	end

	def new
		@category = Category.new
		@category.visible = true
	end

	def create
		@category = Category.new(params[:category])
		if @category.save
			flash[:success] = "Category created successfully"
			redirect_to @category
		else
			render 'new'
		end
	end

	def destroy
		@category = Category.find(params[:id])
		@category.destroy
		flash[:success] = "Category deleted"
		redirect_to categories_path
	end

	def update
		@category = Category.find(params[:id])
		if @category.update_attributes(params[:category])
			redirect_to @category
			flash[:success] = "Successfully saved category information"
		else
			render 'edit'
			flash[:fail] = "Could not save the category information"
		end
	end
end