class VariantCategory < ActiveRecord::Base
	before_save :default_values
  attr_accessible :description, :name, :variant_category_order, :product_id, :visible, :variants_attributes

  belongs_to :product
  has_many :variants, :dependent => :destroy

  accepts_nested_attributes_for :variants, :reject_if => lambda { |a| a[:name].blank? },
  	:allow_destroy => true

  def default_values
  	self.visible = true
  end
end
