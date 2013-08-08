class Wallet < ActiveRecord::Base
  attr_accessible :address, :currency_type_id, :private_key, :profile_id

  belongs_to :profile
  belongs_to :currency_type
end
