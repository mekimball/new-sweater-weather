class MapquestService
  
  def self.conn
    Faraday.new(url: "http://www.mapquestapi.com/geocoding/v1/")
  end

  def self.parsed_location_data(location)
    response = conn.get("address") do |f|
      f.params[:location] =  location
      f.params[:key] = ENV['mapquest_api_key']
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end