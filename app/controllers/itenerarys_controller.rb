class ItenerarysController < ApplicationController
  def show
    @itenerary = Itenerary.find(params[:id])
    @journey = @itenerary.journey
    interactions = @itenerary.interactions
    array = []
    interactions.each do |inter|
      array << inter.user
    end
    @destinations = array.map {|user| user.city }
    @photos = @itenerary.interaction_photos
    @distance = current_user.city_distance @destinations

  end

  def update
  end

  def create
  end

  def destroy
  end

end
