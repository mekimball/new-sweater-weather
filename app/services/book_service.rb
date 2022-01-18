class BookService

  def self.conn
    Faraday.new(url: "https://openlibrary.org/")
  end

  def self.book_search(location, quantity)
    response = conn.get("search.json") do |f|
      f.params[q] = location
      f.params[limit] = quantity
    end
  end
end