require 'json'
require 'open-uri'

class FacebookEventsController < ApplicationController
  def pull_fb_events
    access_token = params[:token]
    url = "https://graph.facebook.com/v4.0/me?fields=events.limit(100){cover,description,end_time,event_times,name,place,start_time,ticket_uri,type,admins}&access_token=#{access_token}"
    serialized = open(url).read
    @events = JSON.parse(serialized)['events']['data']
    render :index
  end

  def new
  end

  def create
    # raise
    @event = Event.new(
      title: params[:event][:name],
      description: params[:event][:description],
      user: current_user,
      end_time: params[:event][:end_time],
      start_time: params[:event][:start_time],
      cover: params[:event][:cover][:source],
      fb_event_id: params[:event][:id]
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
