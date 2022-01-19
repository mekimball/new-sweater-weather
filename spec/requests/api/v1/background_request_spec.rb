require 'rails_helper'

RSpec.describe 'weather requests' do
  it 'can return a forecast', :vcr do
    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to have_http_status(200)
    background = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]

    expect(background).to have_key(:image)
    expect(background[:image][:location]).to eq('denver,co')
    expect(background[:image][:author]).to eq('Dillon Wanner')
    expect(background[:image][:author_profile]).to eq('https://unsplash.com/@dillydallying')
    expect(background[:image]).to have_key(:image_url)
  end
end