class BookFacade
  def self.search_book(location, quantity = 1)
    books = BookService.book_search(location, quantity)
    mapped_books = books[:docs].map do |book|
      Book.new(book)
    end
    return mapped_books, location_weather(location)
  end

  def self.location_weather(location)
    coords = MapquestFacade.get_location(location)
    weather = WeatherService.get_weather(coords.lattitude, coords.longitude)
    Weather.new(weather)
  end
end