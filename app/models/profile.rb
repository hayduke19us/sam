class Profile < ActiveRecord::Base

  belongs_to :user

  validates_presence_of :latitude, :longitude

  geocoded_by :ip_address
  after_validation :geocode

  def ip_address ip
    ip
  end

end
