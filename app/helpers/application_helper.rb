module ApplicationHelper
	require "json"
	require "open-uri"

  # Allows the Devise forms to be displayed anywhere in the app
  def resource_name
    :user
  end
   
  def resource
    @resource ||= User.new
  end
   
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

	# Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "AKart"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  # Returns the current exchange rate of bitcoins to us dollars from mtgox
  def usd_to_btc(amount)
		result = JSON.parse(open('http://data.mtgox.com/api/2/BTCUSD/money/ticker_fast').read)
    amount / result['data']['sell']['value'].to_f
  end

  # Returns the current exchange rate of litecoins to us dollars from btc-e
  def usd_to_ltc(amount)
  	result = JSON.parse(open('https://btc-e.com/api/2/ltc_usd/ticker').read)
  	amount / result['ticker']['sell'].to_f
  end
end
