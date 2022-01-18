class BookService

  def self.conn
    Faraday.new(url: "https://openlibrary.org/")
  end

  def self.book_search(location, quantity)
    response = conn.get("search.json?q=#{location}&limit=#{quantity}")
    JSON.parse(response.body, symbolize_names: true)
  end
end