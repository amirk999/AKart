class Variant < ActiveRecord::Base
  attr_accessible :default, :description, :name, :price, :variant_category_id, :visible

  belongs_to :variant_category
end
