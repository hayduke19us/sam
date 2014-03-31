class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_one :profile

  validates_presence_of :email, :encrypted_password

  def religion
    self.profile.religion
  end

  def latitude
    self.profile.latitude
  end

  def longitude
    self.profile.longitude
  end

end
