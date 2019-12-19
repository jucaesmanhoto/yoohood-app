class PlacesController < ApplicationController
  before_action :set_locale

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
      redirect_to root_path
    else
      render :new
    end
  end

  def set_locale
    I18n.locale = params.fetch(:locale, I18n.default_locale).to_sym
  end

  def default_url_options
    { locale: I18n.locale == I18n.default_locale ? nil : I18n.locale }
  end
  
  private

  def place_params
    params.require(:place).permit(:name, :address, :city, :state, :country, :latitude, :longitude, :capacity, :front_picture)
  end
end
