class UsersController < ApplicationController
  respond_to :js, :html
  before_action :authenticate_user!
  before_action :authenticate_users_guardian
  before_action :authenticate_guardian!

  def dashboard
    @users = User.all
    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.lat
      marker.lng user.long
    end
    @map = "default_map"
  end

  def map_choice
    unless params[:map_choice]
      @map_choice = "default_map"
    else 
      @map_choice = params[:map_choice]
    end
    respond_with @map_choice
  end

  def authenticate_users_guardian
    if current_user.guardian == current_guardian
      return
    else
      sign_out current_guardian
      redirect_to new_guardian_session_path
    end
  end

end
