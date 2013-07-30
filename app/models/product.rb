class Product < ActiveRecord::Base
	before_destroy :ensure_not_referenced_by_any_cart_item
	default_scope order('name ASC')

  attr_accessible :category_id, :description, :name, :price, :sku, :visible, :variant_categories_attributes

  validates :name, :description, :category_id, :presence => true
  validates :price, :presence => true, :numericality => { :greater_than_or_equal_to => 0.01 }

  belongs_to :category
  has_many :variant_categories, :dependent => :destroy
  has_many :cart_items

  accepts_nested_attributes_for :variant_categories, :reject_if => lambda { |a| a[:name].blank? },
  	:allow_destroy => true

  private
  	def ensure_not_referenced_by_any_cart_item
  		if cart_items.empty?
  			return true
  		else
  			errors.add(:base, 'This product is in a cart')
  			return false
  		end
  	end
end
