class CartItem < ActiveRecord::Base
  attr_accessible :price, :cart_id, :product_id, :quantity

  validates :quantity, :numericality => {:only_integer => true}

  belongs_to :product
  has_and_belongs_to_many :variants

  def totalPrice
  	total = self.product.price

  	self.variants.each do |v|
  		total += v.price
  	end
  	total
  end
end
