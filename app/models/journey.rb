class Journey < ActiveRecord::Base

  include Shaman

  belongs_to :user
  has_one :itenerary

  validates :name, :user_id, presence: true
  validates :user_id, uniqueness: { scope: :name }

  after_save :begin_journey

  def begin_journey
    journey =  Shaman::Journey.new journey: self
    journey.create_itenerary
  end

  def short?
    self.distance == "short"
  end

  def long?
    self.distance == "long"
  end

end
