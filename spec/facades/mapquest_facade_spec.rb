require 'rails_helper'

RSpec.describe MapquestFacade do
  it 'returns a location', :vcr do
    location = MapquestFacade.get_location('Denver,CO')

    expect(location).to be_a(Location)
  end
end