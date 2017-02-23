class SearchController < ApplicationController
  def index
    # response = Faraday.get("https://api.bestbuy.com/v1/stores((area(#{params[:search]},25)))?apiKey=#{ENV['bestbuy_api']}&format=json")
    # binding.pry
    response = BestbuyService.search(params[:search])
    parsed = JSON.parse(response.body)
    @stores = Store.make(parsed['stores'])
    @total = parsed['total']
  end
end
