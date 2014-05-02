class GuardiansController < ApplicationController

  before_action :interactions

  def for_parents
  end

  def recent
    @recent_interactions = Interactions.recent(@interactions)
    respond_with @recent_interactions
  end

  def blocked
    @blocked_interactions  = Interactions.blocked(@interactions)
  end

  def friends
    @friends_interactions  = Interactions.friends(@interactions)
  end

  def questions
    @questions_interactions  = Interactions.questions(@interactions)
  end

  def answers
    @answers_interactions = Interactions.answers(@interactions)
  end

  def interactions
    @interactions = current_user.interactions
    @interactions
  end


end
