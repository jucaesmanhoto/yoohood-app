require 'json'
require 'open-uri'

class FacebookEventsController < ApplicationController
  before_action :set_locale

  def index
    pulled_events = FacebookServices.new(params[:token]).pull_fb_events
    if pulled_events[2].present?
      flash[:alert] = "Invalid Facebook Access Token."
      @events = []
      @adms = []
      redirect_to fb_token_path
    else
      @events = pulled_events[0]
      @adms = pulled_events[1]
    end
  end

  def new
  end

  def create
    @event = Event.new(event_params)
    @event.fb_event_id = params[:event][:fb_event_id]
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
      JSON(params[:admins]).each do |admin|
        if FbEventAdmin.find_by_fb_user_id(admin['id']).nil?
          fb_event_admin = FbEventAdmin.create(fb_user_id: admin['id'], name: admin['name'])
        else
          fb_event_admin = FbEventAdmin.find_by_fb_user_id(admin['id'])
        end
        EventFbEventAdmin.create(fb_event_admin: fb_event_admin, event: @event)
      end

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

  def set_locale
    I18n.locale = params.fetch(:locale, I18n.default_locale).to_sym
  end

  def default_url_options
    { locale: I18n.locale == I18n.default_locale ? nil : I18n.locale }
  end
  
  private

  def event_params
    params.require(:event).permit(:title, :description, :end_time, :start_time, :cover, :ticket_uri, places_attributes: %i[id name address city state country latitude longitude])
  end
end
