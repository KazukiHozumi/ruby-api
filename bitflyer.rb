require 'net/http'
require 'uri'

uri = URI.parse("https://api.bitflyer.com")
uri.path = '/v1/getmarkets'

https = Net::HTTP.new(uri.host, uri.port)

https.use_ssl = true

response = https.get(uri.request_uri)

puts response.body
