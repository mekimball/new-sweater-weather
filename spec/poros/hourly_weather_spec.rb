require 'rails_helper'

RSpec.describe HourlyWeather do
  before do
    @hourly_weather = WeatherFacade.get_weather('39.738453',
                                                '-104.984853')[:hourly_weather]
  end

  it 'exists', :vcr do
    expect(@hourly_weather.first).to be_a(HourlyWeather)
  end

  it 'has attributes', :vcr do
    expect(@hourly_weather.length).to eq(8)
    expect(@hourly_weather.first.time).to eq('10:00 AM')
    expect(@hourly_weather.first.temperature).to eq(44.96)
    expect(@hourly_weather.first.conditions).to eq('overcast clouds')
    expect(@hourly_weather.first.icon).to eq('04d')
  end
end
