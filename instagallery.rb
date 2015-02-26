require "sinatra"
require "haml"
require "httparty"


get "/" do
  client_id = ENV["INSTA_CLIENT_ID"]
  keyword = "adopteffort"
  search_url = "https://api.instagram.com/v1/tags/#{keyword}/media/recent?client_id=#{client_id}"

  response = HTTParty.get(search_url)

  @grams = JSON.parse(response.body)['data']

  if @grams
    haml :success
  else
    haml :error
  end
end
