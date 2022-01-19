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
    @travel_time = trip_time(data)
    @dest_latitude = data[:route][:boundingBox][:ul][:lat]
    @dest_longitude = data[:route][:boundingBox][:ul][:lng]
  end

  def trip_time(data)
    if !data[:route].has_key?(:distance)
      "Impossible Route"
    else
      (data[:route][:realTime] / 3600).round(2)
    end
  end
end