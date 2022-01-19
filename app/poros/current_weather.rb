class CurrentWeather
  attr_reader :datetime,
              :sunrise,
              :sunset,
              :temperature,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :conditions,
              :icon

  def initialize(data)
    @datetime     = Time.at(data[:dt]).strftime('%A, %b %d')
    @sunrise      = Time.at(data[:sunrise]).strftime('%l:%M %p')
    @sunset       = Time.at(data[:sunset]).strftime('%l:%M %p')
    @temperature  = data[:temp]
    @feels_like   = data[:feels_like]
    @humidity     = data[:humidity]
    @uvi          = data[:uvi]
    @visibility   = data[:visibility]
    @conditions   = data[:weather].first[:description]
    @icon         = data[:weather].first[:icon]
  end
end
