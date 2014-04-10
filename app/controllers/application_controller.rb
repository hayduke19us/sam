class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception

  def after_sign_in_path_for user
    if user.class.name == 'User'
      unless user.guardian
        new_guardian_registration_path
      else
        new_guardian_session_path
      end
    elsif user.class.name == 'Guardian'
      users_dashboard_path
    end
  end

  def after_sign_out_path_for user
    sign_out current_user.guardian
    root_path
  end
end
