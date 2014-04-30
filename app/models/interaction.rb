class Interaction < ActiveRecord::Base

  belongs_to :itenerary
  belongs_to :user

  validates :itenerary_id, :user_id, presence: true
  validates_uniqueness_of :user_id, scope: :itenerary_id

  def self.users interactions
    array = []
    interactions.each do |interaction|
      array << interaction.user
    end
    array
  end

end
