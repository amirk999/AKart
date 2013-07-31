class Product < ActiveRecord::Base
	before_destroy :ensure_not_referenced_by_any_cart_item
	default_scope order('name ASC')

  belongs_to :category
  has_many :variant_categories, :dependent => :destroy
  has_many :cart_items

  has_one :slider_image, :dependent => :destroy, 
          :class_name => "Image", :foreign_key => "product_slider_id"
  has_one :main_image, :dependent => :destroy,
          :class_name => "Image", :foreign_key => "product_main_id"
  has_many :additional_images, :dependent => :destroy,  :class_name => "Image", 
                                                        :foreign_key => "product_additional_id"

  attr_accessible :category_id, :description, :name, :price, :sku, :visible, 
                  :variant_categories_attributes, :slider_image_attributes,
                  :main_image_attributes, :additional_images_attributes

  validates :name, :description, :category_id, :presence => true
  validates :price, :presence => true, :numericality => { :greater_than_or_equal_to => 0.01 }
  validates :main_image, :presence => true

  accepts_nested_attributes_for :variant_categories, 
    :reject_if => lambda { |a| a[:name].blank? },
  	:allow_destroy => true

  accepts_nested_attributes_for :additional_images, 
    :reject_if => lambda { |t| t[:additional_image].nil? },
    :allow_destroy => true

  accepts_nested_attributes_for :slider_image
  accepts_nested_attributes_for :main_image

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
