require 'rails_helper'

RSpec.describe CurrentWeather do
  before do
    @current_weather = WeatherFacade.get_weather('39.738453', '-104.984853')[:current_weather]
  end

  it 'exists', :vcr do
    expect(@current_weather).to be_a(CurrentWeather)
  end

  it 'has attributes', :vcr do
    expect(@current_weather.conditions).to eq('overcast clouds')
    expect(@current_weather.feels_like).to eq(45.66)
    expect(@current_weather.humidity).to eq(34)
    expect(@current_weather.icon).to eq('04d')
    expect(@current_weather.sunrise).to eq(' 7:17 AM')
    expect(@current_weather.sunset).to eq(' 5:02 PM')
    expect(@current_weather.temperature).to eq(45.66)
    expect(@current_weather.uvi).to eq(1.21)
    expect(@current_weather.visibility).to eq(10000)
  end
end