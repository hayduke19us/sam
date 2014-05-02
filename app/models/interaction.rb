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

  def self.recent(interactions, time, amount=1)
    array = []
    interactions.each do |inter|
      array << inter if inter.send("#{time}_past", amount)
    end
    array
  end

  def day_past amount=1
    self.created_at >= amount.day.ago.to_s  
  end

  def week_past amount=1
    self.created_at >= amount.week.ago.to_s  
  end

  def month_past amount=1
    self.created_at >= amount.month.ago.to_s  
  end

  #the user's guardian from interaction
  def guardian
    self.user.guardian
  end

  def created_time
    t =  self.created_at
    t.to_formatted_s(:long_ordinal)
  end

end
