class Background
  attr_reader :location,
              :image_url,
              :author,
              :author_profile

  def initialize(data, city)
    @location = city
    @image_url = data[:results].first[:urls][:raw]
    @author = data[:results].first[:user][:name]
    @author_profile = data[:results].first[:user][:links][:html]
  end
end
