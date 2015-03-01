require "sinatra"
require "haml"
require "httparty"


get "/" do
  client_id = ENV["INSTA_CLIENT_ID"]
  keyword = "adopteffort"
  count = 100
  search_url = "https://api.instagram.com/v1/tags/#{keyword}/media/recent?client_id=#{client_id}&count=#{count}"

  response = HTTParty.get(search_url)

  @grams = JSON.parse(response.body)['data']

  if @grams
    @grams.sort!{|a, b| b['created_time'] <=> a['created_time'] }
    haml :success
  else
    haml :error
  end
end
