class Variant < ActiveRecord::Base
  before_save :default_values
  attr_accessible :default, :description, :name, :price, :variant_category_id, :visible

  belongs_to :variant_category

  def default_values
  	self.visible = true
  end

end
