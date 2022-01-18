require 'rails_helper'

RSpec.describe BookFacade do
  it 'returns a book', :vcr do
    book = BookFacade.search_book('denver,co', 1)

    expect(book).to be_a(Book)
  end
end