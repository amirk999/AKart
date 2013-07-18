class VariantCategory < ActiveRecord::Base
  attr_accessible :description, :name, :variant_category_order, :product_id, :visible

  belongs_to :product
  has_many :variants
end
