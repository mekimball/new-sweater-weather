class BackgroundService
  
  def self.conn
    Faraday.new(url: "https://api.unsplash.com/search/")
  end

  def self.parsed_background(location)
    response = conn.get("photos") do |f|
      f.params[:query] =  location
      f.params[:client_id] = ENV['unsplash_api_key']
      f.params[:per_page] = 1
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end