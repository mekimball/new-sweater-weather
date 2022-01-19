require 'rails_helper'

RSpec.describe WeatherService do

  it 'can establish a connection', :vcr do
    expect(WeatherService.conn).to be_a(Faraday::Connection)
  end

  it 'can return current weather data', :vcr do
    results = WeatherService.get_weather('39.7385', '-104.9849')[:current]

    expect(results).to be_a(Hash)
    expect(results).to have_key(:dt)
    expect(results).to have_key(:sunrise)
    expect(results).to have_key(:sunset)
    expect(results).to have_key(:temp)
    expect(results).to have_key(:feels_like)
    expect(results).to have_key(:humidity)
    expect(results).to have_key(:uvi)
    expect(results).to have_key(:visibility)
    expect(results[:weather].first).to have_key(:description)
    expect(results[:weather].first).to have_key(:icon)
  end

  it 'can return daily weather', :vcr do
    results = WeatherService.get_weather('39.7385', '-104.9849')[:daily]

    expect(results).to be_an(Array)
    expect(results.first).to be_a(Hash)
    expect(results.first).to have_key(:dt)
    expect(results.first).to have_key(:sunrise)
    expect(results.first).to have_key(:sunset)
    expect(results.first[:temp]).to have_key(:max)
    expect(results.first[:temp]).to have_key(:min)
    expect(results.first[:weather].first).to have_key(:description)
    expect(results.first[:weather].first).to have_key(:icon)
  end

  it 'can find weather by time', :vcr do
    results = WeatherService.time_weather('39.7385', '-104.9849', 3)

    expect(results[:weather].first[:description]).to eq('broken clouds')
  end
end