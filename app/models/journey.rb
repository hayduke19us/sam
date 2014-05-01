class Journey < ActiveRecord::Base

  include Shaman

  belongs_to :user
  has_one :itenerary, dependent: :destroy

  validates :name, :user_id, :distance,  presence: true
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

  def interactions
    self.itenerary.interactions
  end

  def self.search query, id
    ::Journey.where("name LIKE ? AND user_id = ?", "%#{query}%", "#{id}")
  end

end
