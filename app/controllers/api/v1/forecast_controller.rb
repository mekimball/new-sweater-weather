class Api::V1::ForecastController < ApplicationController

  def index
    coords = MapquestFacade.get_location(params[:location])
    render json: {data: { id: 'null', type: 'forecast', attributes: WeatherFacade.get_weather(coords.lattitude, coords.longitude)}}
  end
end