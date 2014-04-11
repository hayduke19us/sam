class Itenerary < ActiveRecord::Base
  belongs_to :journey

  validates :journey_id, presence: true
end
