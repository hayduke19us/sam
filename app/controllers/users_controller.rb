class UsersController < ApplicationController
  respond_to :js, :html
  before_action :authenticate_user!
  before_action :authenticate_users_guardian
  before_action :authenticate_guardian!

  def dashboard
    @users = User.all
    unless current_user.interactions.empty?
      @hash = gmap
    end
    @map = "default_map"
  end

  def history
    @journeys = current_user.journeys
  end

  def map_choice
    @options_hash = {map_choice: params[:map_choice], hash: gmap}
    respond_with @options_hash
  end

private

  def authenticate_users_guardian
    if current_user.guardian == current_guardian
      return
    else
      sign_out current_guardian
      redirect_to new_guardian_session_path
    end
  end


  def gmap
    unless current_user.journeys.empty?
      interactions = current_user.interactions_users
      hash = Gmaps4rails.build_markers(interactions) do |user, marker|
        marker.lat user.lat
        marker.lng user.long
      end
    end
    hash
  end

end
