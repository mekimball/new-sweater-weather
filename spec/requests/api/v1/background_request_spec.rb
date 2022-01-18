require 'rails_helper'

RSpec.describe 'weather requests' do
  it 'can return a forecast', :vcr do
    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to have_http_status(200)
    forecast = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
  end
end