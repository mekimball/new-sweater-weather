require 'rails_helper'

RSpec.describe DailyWeather do
  before do
    @daily_weather = WeatherFacade.get_weather('39.738453', '-104.984853')[:daily_weather]
  end

  it 'exists', :vcr do

    expect(@daily_weather.first).to be_a(DailyWeather)
  end

  it 'has attributes', :vcr do
    expect(@daily_weather.count).to eq(5)
    expect(@daily_weather.first.conditions).to eq('overcast clouds')
    expect(@daily_weather.first.date).to eq("Tuesday, Jan 18")
    expect(@daily_weather.first.max_temp).to eq(48.54)
    expect(@daily_weather.first.min_temp).to eq(36.34)
    expect(@daily_weather.first.icon).to eq('04d')
    expect(@daily_weather.first.sunrise).to eq(' 7:17 AM')
  end
end