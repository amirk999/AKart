class Product < ActiveRecord::Base
	default_scope order('name ASC')

  attr_accessible :category_id, :description, :name, :price, :sku, :visible

  validates :name, :description, :category_id, :presence => true
  validates :price, :presence => true, :numericality => { :greater_than_or_equal_to => 0.01 }

  belongs_to :category
  has_many :variant_categories
end
