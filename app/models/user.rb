class User < ActiveRecord::Base

  include Shaman

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile
  has_one :guardian
  has_many :journeys

  validates :email, :encrypted_password, presence: true

  scope :except_me, ->(user) { where.not(id: user) }

  geocoded_by :ip_address, latitude: :lat, longitude: :long

  reverse_geocoded_by :lat, :long do |obj, results|
    if geo = results.first
      obj.city = geo.city
    end
  end

  after_validation :geocode, :reverse_geocode

  #The actual User attribute current_sign_in_ip will be unchanged.
  #Geocode will inject the values of :lat and :long based off
  #of the spoofed ip when in develoopment or test enviroments.

  def ip_address
    if Rails.env == "test"
      "50.78.167.161"
    elsif Rails.env == "production"
      self.current_sign_in_ip
    end
  end

  def religion
    self.profile.religion
  end

  def last_interactions 
    journey = self.journeys.last
    itenerary = journey.itenerary
    itenerary.interactions
  end

  #returns distance from city, or lat and long to current_user
  #I'm seperating this geocode function in case a better option 
  #exist
  def range_finder destination
    self.distance_to(destination)
  end

  #returns an array of users that are 'distance' away from current_user
  def by_distance distance, operator
    array = []
    User.except_me(self).each do |user|
      user_dist = self.range_finder(user.geo)
      if user_dist.send(operator, distance) and user_dist > distance/3 
        array << user
      end
    end
    array
  end

  #returns one random user from an array of users
  def self.random array
    id_count = array.count
    array[rand(id_count)]
  end

  def geo
    [self.lat, self.long]
  end

  #returns a base user for the first interaction in a journey
  #all other interactions will be based of this interaction
  def base_interaction distance
    User.random(self.by_distance(distance, :>))
  end

  def next_interaction distance
    User.random(self.by_distance(distance, :<))
  end

  def iteneraries
    array = []
    self.journeys.each do |journ|
      array << journ.itenerary
    end
    array
  end

  def interactions 
    array = []
    self.iteneraries.each do |iten|
      array << iten.interactions
    end
    array.flatten
  end

  def interactions_users
    array = []
    self.interactions.each do |inter|
      array << inter.user
    end
    array
  end

  def distance_to_increment city1, city2
    unless $redis.get("#{city1}_#{city2}")
      distance = Geocoder::Calculations.distance_between(city1, city2).round
      $redis.set("#{city1}_#{city2}", distance)
    end
    $redis.get("#{city1}_#{city2}").to_i
  end

  #the hash key is the city. The key signifies the city x in the 
  #equation x to y in miles. It makesit easier this way to access the distances
  #by hash in the view @distance[city] because the distances will be under each 
  #city in the Itenerary show view

  def city_distance destinations
    d = destinations
    hash = {}
    count = d.count
    x, y = 0, 1
    while y < count
      hash["#{d[x]}"] = self.distance_to_increment(d[x], d[y]) 
      x += 1
      y += 1
    end
    hash
  end

  def journey_interactions_hash
    hash = {}
    self.journeys.each do |journ|
      hash[journ.name] = journ.interactions
    end
    hash
  end

end
