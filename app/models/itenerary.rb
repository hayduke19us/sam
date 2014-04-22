class Itenerary < ActiveRecord::Base

  belongs_to :journey
  has_many :interactions
  has_many :users, through: :interactions

  validates :journey_id, presence: true

  after_save :create_interactions

  def create_interactions 
    if self.journey.distance == "short"
      base = self.base_interaction 1000 
      self.interaction_observer base, "#base"
      self.interaction_increment self.interactions.first, 3
    elsif self.journey.distance == "long"
      base = self.base_interaction 2000 
      self.interaction_observer base, "#base"
      self.interaction_increment self.interactions.first, 6
    end
  end

  def base_interaction distance
    interaction  = Interaction.new(itenerary_id: self.id,
                                   user_id: user.base_interaction(distance).id)
    interaction.save
    interaction
  end

  def new_interaction distance
    interaction  = Interaction.new(itenerary_id: self.id,
                                   user_id: user.next_interaction(distance).id)
    interaction.save
    interaction
  end

  def interaction_increment base, num
    x, y = 0, (num - 1)
    while x < y
      increment = self.user.distance_to(self.interactions.last.user.geo) 
      unless self.user.by_distance(increment, :<).empty?
        interaction = self.new_interaction(increment)
        self.interaction_observer interaction, "#increment"
      end
      x += 1
      y -= 1
    end
  end

  def user
    journey = self.journey
    journey.user
  end

  def interaction_observer interaction, note
    file = File.open(Itenerary.observer_path, "a+")
    unless interaction == nil
      file.puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-==-=-=-=-=-=-=-=-=-=-=-=-="
      file.puts note
      file.puts "Interaction: #{interaction.id}"
      file.puts "User => #{interaction.user.email}"
      file.puts "Distance From User: #{self.user.range_finder(interaction.user.geo)}"
      file.puts "----------------------------------------------------------------"
    else
      file.puts note
      file.puts "Interaction nil"
    end
      file.close

  end

  def self.observer_path
    File.expand_path('../../sam/test/observer.rb', '__FILE__')
  end

end
