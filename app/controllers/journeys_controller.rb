class JourneysController < ApplicationController
  def create
    journey = Journey.new(name: params[:name], 
                             distance: params[:distance],
                             user_id: current_user.id)
    if journey.save
      itenerary = journey.itenerary
      redirect_to itenerary_path(itenerary) 
    end
  end

  def destroy
  end
end
