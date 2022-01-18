require 'rails_helper'

RSpec.describe Book do
  before do
    @book = BookFacade.search_book('Denver,co').first
  end

  it 'exists', :vcr do
    expect(@book).to be_a(Book)
  end

  it 'has attributes', :vcr do
    expect(@book.title).to eq('Denver, Co')
    expect(@book.author).to eq('Universal Map')
    expect(@book.isbn).to eq(["9780762507849", "0762507845"])
    expect(@book.publisher).to eq("Universal Map Enterprises")
  end
end