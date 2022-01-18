require 'rails_helper'

RSpec.describe BookFacade do
  it 'returns a book', :vcr do
    book = BookFacade.search_book('denver,co').first

    expect(book).to be_a(Book)
  end
end