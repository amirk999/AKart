class Image < ActiveRecord::Base
  attr_accessible :category_id, :product_additional_id, :product_main_id, :product_slider_id, :image

  has_attached_file :image, :styles => { :slider => "940x300>", :main => "320x200>", :small => "192x120>"}

  belongs_to :category
  belongs_to :product_slider, :class_name => "Product", :foreign_key => "product_slider_id"
  belongs_to :product_main, :class_name => "Product", :foreign_key => "product_main_id"
  belongs_to :product_additional, :class_name => "Product", :foreign_key => "product_additional_id"
end
