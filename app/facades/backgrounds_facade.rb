class BackgroundsFacade
  def self.get_background(city)
    background = BackgroundService.parsed_background(city)
    Background.new(background, city)
  end
end
