require 'rails_helper'

RSpec.describe BookService do
  it 'can establish a connection', :vcr do
    expect(BookService.conn).to be_a(Faraday::Connection)
  end

  it 'can return book data', :vcr do
    results = BookService.book_search('denver,co', 5)
    require 'pry'; binding.pry
  end
end

# You will be using the “Open Library API” to search for books based on a destination city provided by the user. Presume that your user will give a known “good” location. (you can handle edge cases later)
# Your endpoint should follow this format:
# GET /api/v1/book-search?location=denver,co&quantity=5
# please do not deviate from the names of the endpoint or query parameter, be sure it is called “book-search” and “location” and “quantity”, respectively
# quantity should be a positive integer greater than 0
# Your API will return:
# the destination city
# the forecast in that city right now
# the total number of search results found
# a quantity of books about the destination city