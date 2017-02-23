class SearchController < ApplicationController
  def index
    response = Faraday.get("https://api.bestbuy.com/v1/stores((area(80202,25)))?apiKey=#{ENV['bestbuy_api']}&format=json")
    @stores = Json.parse(response)
    binding.pry
  end
end
