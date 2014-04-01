class ProfilesController < ApplicationController

  def create
    profile = Profile.new(ip_address: current_user.current_signed_in_ip,
                          religion: params[:religion],
                          user_id: current_user.id)
    if profile.save
      redirect_to users_dashboard_path
    end
  end

end
