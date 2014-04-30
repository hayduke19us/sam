class ItenerarysController < ApplicationController

  respond_to :js, :html

  def show
    user = current_user
    @itenerary = Itenerary.find(params[:id])
    @journey = @itenerary.journey
    interactions = @itenerary.interactions
    @hash = gmap interactions

    array = []
    interactions.each do |inter|
      array << inter.user
    end

    @destinations = array.map {|user| user.city }
    @city = @destinations.first

    #a hash for the Gmap markers
    @hash = gmap interactions
    @map = "default_map"

    @photos = @itenerary.interaction_photos
    @base = user.distance_to_increment(user.city, @destinations.first)
    @distance = user.city_distance @destinations
    @total_distance = total_distance
  end

  def choose_city
    @itenerary = Itenerary.find(params[:id])
    @photos = @itenerary.interaction_photos 
    @respond = {photos: @photos, 
                city: params[:city]}
    respond_with @respond
  end

  def gmap interactions
    #the map requires a partial with the style of map 
    #and a markers hash for desired pins
    Gmaps4rails.build_markers(Interaction.users(interactions)) do |user, marker|
      marker.lat user.lat
      marker.lng user.long
    end
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
