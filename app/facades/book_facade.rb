class BookFacade
  def self.search_book(location, limit = 1)
    books = BookService.book_search(location, limit)
    books[:docs].map do |book|
      Book.new(book)
    end
  end
end