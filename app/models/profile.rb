class Profile < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :country, :first_name, :last_name, :postcode, :state

  belongs_to :user
  has_many :wallets, :dependent => :nullify
end
