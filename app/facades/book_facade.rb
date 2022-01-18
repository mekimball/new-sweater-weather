class BookFacade
  def self.search_book(location, limit = 1)
    book = BookService.book_search(location, limit)
    Book.new(book)
  end
end