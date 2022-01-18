class MapquestFacade
  def self.get_location(city)
    location = MapquestService.parsed_location_data(city)
    latLng = location[:results].first[:locations].first[:latLng]
    Location.new(latLng)
  end
end