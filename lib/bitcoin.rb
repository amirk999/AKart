require 'net/http'
require 'json'

class Bitcoin
  def initialize(user, pass, host, port)
    @uri = URI.parse("http://#{user}:#{pass}@#{host}:#{port}")
  end
 
  def method_missing(name, *args)
    post_body = { 'method' => name, 'params' => args, 'id' => 'jsonrpc' }.to_json
    resp = JSON.parse( http_post_request(post_body) )
    raise JSONRPCError, resp['error'] if resp['error']
    resp['result']
  end
 
  def http_post_request(post_body)
    http    = Net::HTTP.new(@uri.host, @uri.port)
    request = Net::HTTP::Post.new(@uri.request_uri)
    request.basic_auth @uri.user, @uri.password
    request.content_type = 'application/json'
    request.body = post_body
    http.request(request).body
  end

  # Create a wallet for the specified user id and return the address and private key
  # If the user_id already has a wallet, then the existing wallet information will be returned
  def create_wallet(user_id)
    address = self.getaccountaddress user_id.to_s
    privkey = self.dumpprivkey address
    Hash["address" => address, "privkey" => privkey]
    #{address: address, privkey: privkey}
  end

  class JSONRPCError < RuntimeError; end
end