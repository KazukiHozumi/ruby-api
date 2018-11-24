require 'net/http'
require 'uri'
require 'json'

puts "↓↓　zipcodeを入力してください　↓↓"
zipcode = gets.chomp

params = URI.encode_www_form(zipcode: zipcode)
uri = URI.parse("http://zipcloud.ibsnet.co.jp/api/search?#{params}")
response = Net::HTTP.start(uri.host, uri.port) do |http|
  http.open_timeout = 5
  http.read_timeout = 10
  http.get(uri.request_uri)
end

result = JSON.parse(response.body)

puts result