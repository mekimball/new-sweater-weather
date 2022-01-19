require 'rails_helper'

RSpec.describe 'weather requests' do
  it 'can return a forecast', :vcr do
    get '/api/v1/forecast?location=denver,co'

    expect(response).to have_http_status(200)
    forecast = JSON.parse(response.body,
                          symbolize_names: true)[:data][:attributes]

    expect(forecast).to be_a(Hash)
    expect(forecast).to have_key(:current_weather)
    expect(forecast).to have_key(:daily_weather)
    expect(forecast).to have_key(:hourly_weather)

    expect(forecast[:current_weather]).to have_key(:sunrise)
    expect(forecast[:current_weather]).to have_key(:sunset)
    expect(forecast[:current_weather]).to_not have_key(:dew_point)

    expect(forecast[:daily_weather].first).to have_key(:sunset)
    expect(forecast[:hourly_weather].first).to have_key(:temperature)
  end
end
