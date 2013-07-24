class Category < ActiveRecord::Base
	default_scope order('category_order ASC, name ASC')
  attr_accessible :name, :category_order, :visible

  validates :name, :presence => true

  has_many :products

  resourcify
end
