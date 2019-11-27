require 'json'
require 'open-uri'

class FacebookEventsController < ApplicationController
  def index
    access_token = "EAAGcDbKigf8BABp1rtMyGw3ZB8T5w55kk6f75GWGrmlBZBI21HIFR6maUvHFJvkSuJX5ZC9ZCRdpmsrkWGVjLZBfZCGg1bzcj4NfBY6Cjy5gJeYGLS8VYJwZB659ANARnCFU797rNCVdhZBQIGZCkEQe4eJrktOUSinC55SFUY0loUeiCivTXf8bXRkKkMmrRBRxO5qe2RyeMjgZDZD"
    url = "https://graph.facebook.com/v4.0/me?fields=events.limit(100){cover,description,end_time,event_times,name,place,start_time,ticket_uri,type,admins}&access_token=#{access_token}"
    serialized = open(url).read
    @events = JSON.parse(serialized)['events']['data']
  end

  def create
    @event = Event.new(
      title: params[:event][:name],
      description: params[:event][:description],
      user: current_user,
      end_time: params[:event][:end_time],
      start_time: params[:event][:start_time],
      cover: params[:event][:cover][:src],
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
    raise
  end

  private

  def fb_event_params
    # params.require(:event).permit(:name, :place, :description)
  end
end
