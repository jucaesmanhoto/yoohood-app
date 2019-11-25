class PlacesController < ApplicationController
  def index
    @places = Place.geocoded

    @markers = @places.map do |place|
      {
        lat: place.latitude,
        lng: place.longitude
      }
    end
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to place_path(@place)
    else
      render :new
    end
  end

  private

  def place_params
    params.require(:place).permit(:name, :address, :city, :state, :country, :latitude, :longitude, :capacity)
  end
end
