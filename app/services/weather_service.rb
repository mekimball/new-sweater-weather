class WeatherService
  def self.conn
    Faraday.new(url: 'https://api.openweathermap.org/data/2.5/')
  end

  def self.time_weather(lat, lon, hours)
    response = conn.get('onecall') do |f|
      f.params[:appid] = ENV['weather_api_key']
      f.params[:lat] = lat
      f.params[:lon] = lon
      f.params[:units] = 'imperial'
    end
    parsed = JSON.parse(response.body, symbolize_names: true)
    parsed[:hourly][hours.round(0)]
  end

  def self.get_weather(lat, lon)
    response = conn.get('onecall') do |f|
      f.params[:appid] = ENV['weather_api_key']
      f.params[:lat] = lat
      f.params[:lon] = lon
      f.params[:units] = 'imperial'
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
