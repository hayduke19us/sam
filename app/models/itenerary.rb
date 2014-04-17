class Itenerary < ActiveRecord::Base

  belongs_to :journey
  has_many :interactions
  has_many :users, through: :interactions

  validates :journey_id, presence: true

  after_save :create_interactions

  def create_interactions 
    if self.journey.distance == "short"
      self.new_interaction 300 
      self.short_increment self.interactions.first
    elsif self.journey.distance == "long"
      self.new_interaction 600 
      self.long_increment self.interactions.first
    end
  end

  def new_interaction distance
    interaction  = Interaction.new(itenerary_id: self.id,
                                   user_id: user.base_interaction(distance).id)
    interaction.save
  end

  def short_increment base
    increment = user.distance_to(base.user.geo) / 3
    x, y = 0, 2 
    while x < 2 
      self.new_interaction(increment * y)
      x += 1
      y -= 1 
    end
  end

  def long_increment base
    increment = user.distance_to(base.user.geo) / 6
    x, y = 0, 5 
    while x < 5 
      self.new_interaction(increment * y)
      x += 1
      y -= 1 
    end
  end


  def user
    journey = self.journey
    journey.user
  end

end
