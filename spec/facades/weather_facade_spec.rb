require 'rails_helper'

RSpec.describe WeatherFacade do
  it 'returns weather', :vcr do
    weather = WeatherFacade.get_weather('39.7385', '-104.9849')

    expect(weather[:current_weather]).to be_a(CurrentWeather)
  end
end
