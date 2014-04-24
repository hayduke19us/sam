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

end
