class BackgroundFacade
  def self.get_background(city)
    location = BackgroundService.parsed_location_data(city)
    latLng = location[:results].first[:locations].first[:latLng]
    Location.new(latLng)
  end
end