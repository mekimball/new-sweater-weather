require 'rails_helper'

RSpec.describe MapquestService do

  it 'can establish a connection', :vcr do
    expect(MapquestService.conn).to be_a(Faraday::Connection)
  end

  it 'can return locational data', :vcr do
    results = MapquestService.parsed_location_data('Denver,co')
    results_parsed = results[:results].first[:locations].first[:latLng]

    expect(results_parsed).to be_a(Hash)
    expect(results_parsed).to have_key(:lat)
    expect(results_parsed).to have_key(:lng)
    expect(results_parsed[:lat]).to be_a(Float)
    expect(results_parsed[:lng]).to be_a(Float)
  end
end