class BestbuyService

# "https://api.bestbuy.com/v1/stores((area(80202,25)))?apiKey=#{ENV['bestbuy_api']}&format=json")
  def self.search(request)
   conn = Faraday.new(:url => "https://api.bestbuy.com/v1/stores((area(#{request},25)))") do |f|
      f.request :url_encoded
      f.response :logger
      f.adapter Faraday.default_adapter
    end
  conn.get {:apiKey => ENV['bustbuy_api'],
            :format => "json"}
  end

end
