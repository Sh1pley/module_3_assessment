class SearchController < ApplicationController
  def index
    response = Faraday.get("https://api.bestbuy.com/v1/stores((area(80202,25)))?apiKey=#{ENV['bestbuy_api']}&format=json")
    parsed = JSON.parse(response.body)
    @stores = Store.make(parsed['stores'])
    @total = parsed['total']
  end
end
