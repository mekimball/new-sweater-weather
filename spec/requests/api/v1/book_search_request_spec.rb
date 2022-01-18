require 'rails_helper'

RSpec.describe 'returns book info by destination' do
  it 'returns book info', :vcr do
    get '/api/v1/book-search?location=denver,co&quantity=5'

    results = JSON.parse(response.body, symbolize_names: true)

    expect(results).to be_a(Hash)
    expect(results).to have_key(:data)
    expect(results[:data][:type]).to eq('books')
    expect(results[:data][:attributes][:destination]).to eq('denver,co')
    expect(results[:data][:attributes][:forecast][:summary]).to eq('overcast clouds')
    expect(results[:data][:attributes][:forecast][:temperature]).to eq(49.75)
    expect(results[:data][:attributes][:books].first[:title]).to eq('Denver, Co')
    expect(results[:data][:attributes][:books].first[:isbn]).to eq(["9780762507849", "0762507845"])
    expect(results[:data][:attributes][:books].count).to eq(5)
  end
end