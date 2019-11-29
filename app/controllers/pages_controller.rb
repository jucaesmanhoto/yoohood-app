class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home members]

  def home
    @page_name = 'Find a perfect event'
    @events = Event.all
    # @event_near = Event.all.select{ |event| event.places.city ==  }
    @events_recent = Event.all.sort_by { |event| event.created_at }.first(9)
    @events_today = Event.all.select{ |event| Date.parse(event.start_time.to_s) == Date.today }
    @events_diff = @events - @events_recent - @events_today
    @city = request.location.city
  end

  def members
    @page_name = 'members'
  end

  def profile
    # @meta_title = "#{DEFAULT_META["meta_product_name"]} - #{current_user.name.split(' ').first}'s profile"
  end
end
