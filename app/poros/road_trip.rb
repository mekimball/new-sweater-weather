class RoadTrip
  attr_reader :departure_city,
              :destination_city,
              :travel_time,
              :dest_latitude,
              :dest_longitude,
              :temperature

  def initialize(data, start, destination)
    @departure_city = start
    @destination_city = destination
    if !data[:route].has_key?(:distance)
      @travel_time = 'Impossible Route'
      @dest_latitude = ''
      @dest_longitude = ''
    else
      @travel_time = (data[:route][:realTime] / 3600.0).round(2)
      @dest_latitude = data[:route][:boundingBox][:ul][:lat]
      @dest_longitude = data[:route][:boundingBox][:ul][:lng]
    end
  end
end
