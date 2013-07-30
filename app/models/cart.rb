class Cart < ActiveRecord::Base
  attr_accessible :total

  has_many :cart_items, :dependent => :destroy
end
