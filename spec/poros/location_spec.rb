require 'rails_helper'

RSpec.describe Location do
  before do
    @location = MapquestFacade.get_location('Denver,co')
  end

  it 'exists', :vcr do
    expect(@location).to be_a(Location)
  end

  it 'has long and lat', :vcr do

    expect(@location.lattitude).to eq(39.738453)
    expect(@location.longitude).to eq(-104.984853)
  end
end