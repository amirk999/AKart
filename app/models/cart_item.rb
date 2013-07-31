class CartItem < ActiveRecord::Base
  attr_accessible :price, :cart_id, :product_id, :quantity

  validates :quantity, :numericality => {:only_integer => true}

  belongs_to :product
  has_and_belongs_to_many :variants

  def calculateTotal
  	total = self.product.price * self.quantity

  	self.variants.each do |v|
  		total += v.price * self.quantity
  	end
  	self.price = total
  end
end
