class JourneysController < ApplicationController
  def create
    journey = Journey.new(name: params[:name], 
                             distance: params[:distance],
                             user_id: current_user.id)
    if journey.save
      redirect_to root_path
    end
  end

  def destroy
  end
end
