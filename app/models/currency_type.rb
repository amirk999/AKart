class CurrencyType < ActiveRecord::Base
  attr_accessible :name, :rpchost, :rpcpass, :rpcport, :rpcuser

  has_many :wallets, :dependent => :destroy
end
