class Category < ActiveRecord::Base
	default_scope order('category_order ASC, name ASC')

  has_many :products, dependent: :destroy
  has_one :image, :dependent => :destroy

	accepts_nested_attributes_for :image

  attr_accessible :name, :category_order, :visible, :image_attributes

  validates :name, :presence => true
  validates :category_order, :presence => true
  validates :image, :presence => true

  resourcify

end
