class RoadTripFacade
  def self.get_duration(start, destination)
    route = MapquestService.get_directions(start, destination)
    RoadTrip.new(route, start, destination)
  end
end
