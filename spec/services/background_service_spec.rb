require 'rails_helper'

RSpec.describe BackgroundService do

  it 'can establish a connection', :vcr do
    expect(BackgroundService.conn).to be_a(Faraday::Connection)
  end

  it 'can return backgrounds', :vcr do
    results = BackgroundService.parsed_background('Denver,co')

    expect(results).to have_key(:total)
    expect(results).to be_a(Hash)
    expect(results).to have_key(:results)
    expect(results[:results].first).to have_key(:description)
    expect(results[:results].first).to have_key(:id)
  end
end