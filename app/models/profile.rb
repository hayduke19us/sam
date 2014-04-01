class Profile < ActiveRecord::Base

  belongs_to :user

  validates_presence_of :ip_address

  geocoded_by :ip_address
  after_validation :geocode

end
