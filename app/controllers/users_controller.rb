class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_guardian!
  before_action :authenticate_users_guardian

  def dashboard
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
