class Store
  attr_reader :long_name,
              :city,
              :distance,
              :phone_number,
              :store_type

  def initialize(params = {})
    @long_name = params["longName"]
    @city = params["city"]
    @distance = params["distance"]
    @phone_number = params["phone"]
    @store_type = params["storeType"]
  end

  def self.make(response)
    response.map do |store|
      new(store)
    end
  end

end