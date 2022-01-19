class DailyWeather
  attr_reader :date,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :conditions,
              :icon

  def initialize(data)
    @date       = Time.at(data[:dt]).strftime('%A, %b %d')
    @sunrise    = Time.at(data[:sunrise]).strftime('%l:%M %p')
    @sunset     = Time.at(data[:sunset]).strftime('%l:%M %p')
    @max_temp   = data[:temp][:max]
    @min_temp   = data[:temp][:min]
    @conditions = data[:weather].first[:description]
    @icon       = data[:weather].first[:icon]
  end
end
