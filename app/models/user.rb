class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile
  has_one :guardian
  has_many :journeys

  validates :email, :encrypted_password, presence: true

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
    if Rails.env == "development" || Rails.env == "test"
      "50.78.167.161"
    elsif Rails.env == "production"
      self.current_sign_in_ip
    end
  end

  def religion
    self.profile.religion
  end

end
