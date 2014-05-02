class GuardiansController < ApplicationController

  respond_to :js, :html

  before_action :interactions

  def for_parents
  end

  def recent
    interactions = current_user.interactions
    time = params[:time] 
    @recent_interactions = Interaction.recent(interactions, time)
    respond_with @recent_interactions
  end

  def blocked
    @blocked_interactions  = Interaction.blocked(@interactions)
  end

  def friends
    @friends_interactions  = Interaction.friends(@interactions)
  end

  def questions
    @questions_interactions  = Interaction.questions(@interactions)
  end

  def answers
    @answers_interactions = Interaction.answers(@interactions)
  end

  def interactions
    @interactions = current_user.interactions
    @interactions
  end


end
