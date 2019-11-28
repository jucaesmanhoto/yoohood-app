require 'json'
require 'open-uri'

class FacebookEventsController < ApplicationController
  def index
    @events = FacebookServices.new(params[:token]).pull_fb_events
  end

  def new
  end

  def create
    @event = Event.new(event_params)
    @event.fb_event_id = params[:fb_event_id]
    @event.user = current_user
    # @place = Place.new(
    #   name: params[:event][:place][:name],
    #   address: params[:event][:place][:location][:street],
    #   city: params[:event][:place][:location][:city],
    #   state: params[:event][:place][:location][:state],
    #   country: params[:event][:place][:location][:country],
    #   latitude: params[:event][:place][:location][:latitude],
    #   longitude: params[:event][:place][:location][:longitude],
    #   event: @event
    # )

    if @event.save
      respond_to do |format|
        format.html { redirect_to fb_events_path }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'fb_events/index' }
        format.js
      end
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :end_time, :start_time, :cover, places_attributes: [:id, :name, :address, :city, :state, :country, :latitude, :longitude])
  end
end
