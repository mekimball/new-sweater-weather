class Api::V1::RoadTripController < ApplicationController
  def create
    trip = RoadTripFacade.get_duration(params[:origin], params[:destination])
    weather = WeatherService.time_weather(trip.dest_latitude,
                                          trip.dest_longitude, trip.travel_time)
    render json: { data: {
      id: 'null',
      type: 'roadtrip',
      attributes: {
        start_city: trip.departure_city,
        end_city: trip.destination_city,
        travel_time: Time.at(trip.travel_time * 3600).utc.strftime('%H:%M').to_s,
        weather_at_eta: {
          temperature: weather[:temp],
          conditions: weather[:weather].first[:description]
        }
      }
    } }
  end
end
