class EventsController < ApplicationController
  def index
    events_by_city = params[:city].present? ? Place.near(params[:city], 10).map(&:event) : []
    # @events = @events.search_by_city_and_zip_code(params[:city]) if params[:city].present?
    events_by_title = params[:title_description].present? ? Event.search_by_event_and_artist(params[:title_description]) : []

    if params[:date].present?
      date = Date.parse(params[:date])
      events_by_date = Event.where('start_time < ? AND end_time > ?', date.beginning_of_day, date.end_of_day)
    else
      events_by_date = []
    end
    @events = (events_by_city + events_by_title + events_by_date).uniq
    @events = Event.all if @events.count.zero?
  end

  def show
    # raise
    @event = Event.find(params[:id])

    @invite = Invite.new

    @markers = [
      {
        lat: @event.places.first.latitude,
        lng: @event.places.first.longitude
      }
    ]
  end

  def new
    @page_name = 'Register an event'
    @event = Event.new
  end

  def create
  end

  def edit
  end

  def update
    raise
  end

  def destroy
  end
end
