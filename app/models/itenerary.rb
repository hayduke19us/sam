class Itenerary < ActiveRecord::Base

  belongs_to :journey
  has_many :interactions
  has_many :users, through: :interactions

  validates :journey_id, presence: true
end
