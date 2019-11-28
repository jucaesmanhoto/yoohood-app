require 'json'
require 'open-uri'

class FacebookEventsController < ApplicationController
  def index
    @events = FacebookServices.new(params[:token]).pull_fb_events
  end

  def new
  end

  def create
    @event = Event.new(
      title: params[:event][:name],
      description: params[:event][:description],
      user: current_user,
      end_time: params[:event][:end_time],
      start_time: params[:event][:start_time],
      cover: params[:event][:cover],
      fb_event_id: params[:fb_event_id]
    )
    @place = Place.new(
      name: params[:event][:place][:name],
      address: params[:event][:place][:location][:street],
      city: params[:event][:place][:location][:city],
      state: params[:event][:place][:location][:state],
      country: params[:event][:place][:location][:country],
      latitude: params[:event][:place][:location][:latitude],
      longitude: params[:event][:place][:location][:longitude],
      event: @event
    )

    if @event.save && @place.save
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
end
