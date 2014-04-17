class Journey < ActiveRecord::Base
  belongs_to :user
  has_one :itenerary

  validates :name, :user_id, presence: true
  validates :user_id, uniqueness: { scope: :name }

  after_save :create_itenerary

  def create_itenerary
    itenerary = Itenerary.new(journey_id: self.id)
    itenerary.save
  end

end
