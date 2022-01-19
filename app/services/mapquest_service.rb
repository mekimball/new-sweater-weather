class MapquestService
  
  def self.conn
    Faraday.new(url: "http://www.mapquestapi.com/")
  end

  def self.parsed_location_data(location)
    response = conn.get("geocoding/v1/address") do |f|
      f.params[:location] =  location
      f.params[:key] = ENV['mapquest_api_key']
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_directions(start, destination)
    response = conn.get("directions/v2/route") do |f|
      f.params[:to] = destination
      f.params[:from] = start
      f.params[:key] = ENV['mapquest_api_key']
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end