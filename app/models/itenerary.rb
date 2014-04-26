class Itenerary < ActiveRecord::Base

  include Photo

  belongs_to :journey
  has_many :interactions
  has_many :users, through: :interactions

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

end
