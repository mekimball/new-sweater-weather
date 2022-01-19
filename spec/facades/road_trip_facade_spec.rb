require 'rails_helper'

RSpec.describe RoadTripFacade do
  it 'returns a location', :vcr do
    trip = RoadTripFacade.get_duration('Denver,CO', 'pueblo,co')

    expect(trip).to be_a(RoadTrip)
  end
end