class ProfilesController < ApplicationController

  def create
    profile = Profile.new(religion: params[:religion],
                          user_id: current_user.id)
    if params[:city]
      current_user.city = params[:city]
      current_user.save
    end

    if profile.save
      redirect_to users_dashboard_path
    end
  end

end
