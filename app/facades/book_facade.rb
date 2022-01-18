class BookFacade
  def self.search_book(location, quantity = 1)
    books = BookService.book_search(location, quantity)
    books[:docs].map do |book|
      Book.new(book)
    end
  end
end