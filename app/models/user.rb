class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_one :profile

  validates_presence_of :email, :encrypted_password

  geocoded_by "50.78.167.161",
    :latitude => :lat, :longitude => :long
  after_validation :geocode

  def self.ip_address
    if Rails.env.development? || Rails.env.test? 
      return "50.78.167.161"
    else
      return :current_sign_in_ip
    end
  end

  def religion
    self.profile.religion
  end

end
