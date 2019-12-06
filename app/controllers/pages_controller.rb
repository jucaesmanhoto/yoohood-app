class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home members]

  def home
    @page_name = 'Find a perfect event'
    @events = Event.all.reject { |event| event.end_time.present? && event.end_time <= Time.now.getutc() }
    # @event_near = Event.all.select{ |event| event.places.city ==  }
    @events_recent = @events.sort_by { |event| event.created_at }.first(8)
    @events_today = @events.select { |event| Date.parse(event.start_time.to_s) == Date.today }.first(8)
    @events_coming_up = (@events.select { |event| event.start_time > DateTime.now }.sort_by { |event| event.start_time } - @events_today).first(8)
    @events_diff = @events - @events_recent - @events_coming_up
    @city = request.location.city
  end

  def members
    @page_name = 'members'
  end

  def about

  end

  def profile
    # @meta_title = "#{DEFAULT_META["meta_product_name"]} - #{current_user.name.split(' ').first}'s profile"
  end
end
