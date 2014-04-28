class ItenerarysController < ApplicationController

  respond_to :js, :html
  
  def show
    user = current_user
    @itenerary = Itenerary.find(params[:id])
    @journey = @itenerary.journey
    interactions = @itenerary.interactions
    array = []
    interactions.each do |inter|
      array << inter.user
    end
    @destinations = array.map {|user| user.city }
    @city = city
    @photos = @itenerary.interaction_photos
    @base ||= user.distance_to_increment(user.city, @destinations.first)
    @distance ||= user.city_distance @destinations
    @total_distance = total_distance
  end

  def choose_city
    @itenerary = Itenerary.find(params[:id])
    @photos = @itenerary.interaction_photos
    @respond = {photos: @photos, city: params[:city]}
    respond_with @respond
  end

  def city
    unless params[:city]
      @city = @destinations.first
    else
      @city = params[:city]
    end
  end

  def total_distance 
    distance = 0
    @distance.each {|k, v| distance += v } 
    distance + @base
  end

  def update
  end

  def create
  end

  def destroy
  end

end
