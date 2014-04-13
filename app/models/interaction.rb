class Interaction < ActiveRecord::Base

  belongs_to :itenerary
  belongs_to :user

  validates :itenerary_id, :user_id, presence: true

end
