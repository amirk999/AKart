class CategoriesController < ApplicationController
	def index
		@categories = Category.all
	end

	def show
		@category = Category.find(params[:id])
	end

	def edit
		@category = Category.find(params[:id])
	end

	def new
		@category = Category.new
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
end