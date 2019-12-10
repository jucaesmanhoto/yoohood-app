class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_event, only: %i[show edit update ask_for_ownership make_it_mine]

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
    @events = @events.reject { |event| event.end_time <= Time.now.getutc }
    @markers = @events.map do |event|
      {
        lat: event.places.first.latitude,
        lng: event.places.first.longitude,
        image_url: helpers.asset_url('yo_pin-01.png'),
        event_id: event.id
      }
    end
  end

  def show
    @invite = Invite.new
    @trade = Trade.new
    @markers = [
      {
        lat: @event.places.first.latitude,
        lng: @event.places.first.longitude,
        image_url: helpers.asset_url('yo_pin-01.png'),
        event_id: @event.id
      }
    ]
  end

  # REQUIRE EVENTS
  def ask_for_ownership
  end

  def make_it_mine
    @event.update(user: current_user)
    redirect_to event_path(@event)
  end

  def my_events
    user_events = Event.all.select { |event| event.user == current_user }
    @past_events = user_events.select { |event| event.end_time <= DateTime.now }.sort { |a, b| a.start_time <=> b.start_time }
    @events = (user_events - @past_events).sort { |a, b| a.start_time <=> b.start_time }.reverse
  end

  def new
    @page_name = 'Register an event'
    @event = Event.new
  end

  def create
  end

  def edit
  end

  def categories_update
    @event.categories = []
    params[:event][:category_ids].each do |id|
      next if id.empty?

      @event.categories << Category.find(id)
    end
    redirect_to my_events_path(current_user)
  end

  def update
    categories_update
  end

  def destroy
  end

  private

  def set_event
    if params[:event_id].present?
      @event = Event.find(params[:event_id])
    else
      @event = Event.find(params[:id])
    end
  end
end
