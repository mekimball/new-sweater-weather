require 'rails_helper'

RSpec.describe 'road trips' do
  before do
    @user = User.create!({email: 'test@example.com', password: 'password', api_key: "MWbKEvRjZhEfPUu8HM1sPwtt"})
  end

  it 'can return directions', :vcr do
    headers = { 'Content-Type' => 'application/json'}
    trip_params = { origin: 'Denver,CO', destination: 'Pueblo,CO', api_key: "MWbKEvRjZhEfPUu8HM1sPwtt"}
    post '/api/v1/road_trip', headers: headers, params: JSON.generate(trip_params)

    expect(response).to have_http_status(201)
  end
end