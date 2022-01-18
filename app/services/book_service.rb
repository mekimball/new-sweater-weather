class BookService

  def self.conn
    Faraday.new(url: "https://openlibrary.org/")
  end

  def self.book_search(location, limit)
    response = conn.get("search.json?q=#{location}&limit=#{limit}")
    JSON.parse(response.body, symbolize_names: true)
  end
end