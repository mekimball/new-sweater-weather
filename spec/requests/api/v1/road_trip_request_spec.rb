require 'rails_helper'

RSpec.describe 'road trips' do
  before do
    @user = User.create!({ email: 'test@example.com', password: 'password',
                           api_key: 'MWbKEvRjZhEfPUu8HM1sPwtt' })
  end

  it 'can return directions', :vcr do
    headers = { 'Content-Type' => 'application/json' }
    trip_params = { origin: 'Denver,CO', destination: 'Pueblo,CO',
                    api_key: 'MWbKEvRjZhEfPUu8HM1sPwtt' }
    post '/api/v1/road_trip', headers: headers,
                              params: JSON.generate(trip_params)

    expect(response).to have_http_status(200)

    trip = JSON.parse(response.body, symbolize_names: true)

    expect(trip).to have_key(:data)
    expect(trip[:data][:id]).to eq('null')
    expect(trip[:data][:type]).to eq('roadtrip')
    expect(trip[:data][:attributes][:start_city]).to eq('Denver,CO')
    expect(trip[:data][:attributes][:end_city]).to eq('Pueblo,CO')
    expect(trip[:data][:attributes][:travel_time]).to eq('01:49')
    expect(trip[:data][:attributes][:weather_at_eta][:temperature]).to eq(34.43)
    expect(trip[:data][:attributes][:weather_at_eta][:conditions]).to eq('broken clouds')
  end
end
