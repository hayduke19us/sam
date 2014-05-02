
class Itenerary < ActiveRecord::Base

  include Photo
  include Wiki
  include Weather

  belongs_to :journey
  has_many :interactions
  has_many :users, through: :interactions, dependent: :destroy

  validates :journey_id, presence: true

  def user
    journey = self.journey
    journey.user
  end

  def users
    array = []
    self.interactions.each do |inter|
      array << inter.user
    end
    array
  end

  def cities
    array = []
    self.users.each do |user|
      array << user.city
    end
    array
  end

  def photos array
    search = Photo::Search.new array
    search.image_urls
  end

  def interaction_photos
    photos self.cities
  end

  def city_info city
    Wiki::Willy.new(city.to_s).summary
  end

  def city_weather city
    weather = Weather::Forcast.new(city)
    {temp: weather.temp, overview: weather.overview}
  end

  def route
    array = [{lat: self.user.lat, lng: self.user.long}]
    Interaction.users(self.interactions).each do |user|
      array << {lat: user.lat, lng: user.long}
    end
    [array].to_json
  end

end
