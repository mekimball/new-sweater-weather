require 'rails_helper'

RSpec.describe 'returns book info by destination' do
  it 'returns book info', :vcr do
    get '/api/v1/book-search?location=denver,co&quantity=5'

    results = JSON.parse(response.body, symbolize_names: true)

    expect(results).to be_a(Hash)
  end
end