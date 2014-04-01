class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_one :profile

  validates_presence_of :email, :encrypted_password

  geocoded_by :current_sign_in_ip,
    :latitude => :lat, :longitude => :lon
  after_validation :geocode,
    :if => lambda{ |obj| obj.current_sign_in_ip_changed?}

  def religion
    self.profile.religion
  end

end
