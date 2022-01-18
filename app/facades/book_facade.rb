class BookFacade
  def self.search_book(location, quantity = 1)
    collection = BookService.book_search(location, quantity)
    return collection, location_weather(location), books(collection)
  end

  def self.location_weather(location)
    coords = MapquestFacade.get_location(location)
    weather = WeatherService.get_weather(coords.lattitude, coords.longitude)
    CurrentWeather.new(weather[:current])
  end

  def self.books(collection)
    mapped_books = collection[:docs].map do |book|
      Book.new(book)
    end
  end
end