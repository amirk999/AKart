class Cart < ActiveRecord::Base
  attr_accessible :total

  has_many :cart_items, :dependent => :destroy

  def updateTotal
  	total = 0
  	self.cart_items.each do |ci|
  		total += ci.price
  	end
  	self.total = total
  	self.save
  end
end
