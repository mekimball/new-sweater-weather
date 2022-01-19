require 'rails_helper'

RSpec.describe RoadTrip do
  before do
    @trip = RoadTripFacade.get_duration('Denver,co', 'Pueblo,CO')
  end

  it 'exists', :vcr do
    expect(@trip).to be_a(RoadTrip)
  end

  it 'has long and lat', :vcr do
    expect(@trip.departure_city).to eq('Denver,co')
    expect(@trip.dest_latitude).to eq(39.738453)
    expect(@trip.dest_longitude).to eq(-104.987602)
    expect(@trip.destination_city).to eq('Pueblo,CO')
    expect(@trip.travel_time).to eq(1.92)
  end

  it 'returns error if trip is not possible', :vcr do
    other_trip = RoadTripFacade.get_duration('Denver,co', 'London')

    expect(other_trip.departure_city).to eq('Denver,co')
    expect(other_trip.dest_latitude).to eq('')
    expect(other_trip.dest_longitude).to eq('')
    expect(other_trip.destination_city).to eq('London')
    expect(other_trip.travel_time).to eq('Impossible Route')
  end
end
