class BestbuyService

# "https://api.bestbuy.com/v1/stores((area(80202,25)))?apiKey=#{ENV['bestbuy_api']}&format=json")
  def self.search(request)
   conn = Faraday.new(:url => "https://api.bestbuy.com/v1/stores") do |f|
      f.request :url_encoded
      f.response :logger
      f.adapter Faraday.default_adapter
    end
    conn.get {areaFunction: "(area(#{request},25))",
              apiKey: ENV['bustbuy_api'],
              responseFormat: "&format=jason"}
  end

end
