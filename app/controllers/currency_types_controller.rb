class CurrencyTypesController < ApplicationController
  load_and_authorize_resource

  def index
    @currencyTypes = CurrencyType.all
  end

  def new
    @currencyType = CurrencyType.new
  end

  def create
    @currencyType = CurrencyType.new(params[:currency_type])
    if @currencyType.save
      flash[:success] = "Successfully created currency"
      redirect_to @currencyType
    else
      render 'new'
    end
  end

  def edit
    @currencyType = CurrencyType.find(params[:id])
  end

  def update
    @currencyType = CurrencyType.find(params[:id])
    if @currencyType.update_attributes(params[:currency_type])
      redirect_to @currencyType
      flash[:success] = "Successfully saved currency information"
    else
      render 'edit'
      flash[:fail] = "Could not save the currency information"
    end
  end

  def show
    @currencyType = CurrencyType.find(params[:id])
  end
end
