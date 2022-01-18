class BookFacade
  def self.search_book(location, limit)
    book = BookService.book_search(location, limit)
    Book.new(book)
  end
end