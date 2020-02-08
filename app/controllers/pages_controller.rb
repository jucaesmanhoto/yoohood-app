class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home members about]

  def home
    @page_name = 'Find a perfect event'
    @events = Event.all.reject { |event| event.end_time.present? && event.end_time <= Time.now.getutc }
    @events_recent = @events.sort_by(&:created_at).reverse.first(8)
    @events_today = @events.select { |event| Date.parse(event.start_time.to_s) == Date.today }.shuffle
    @events_coming_up = (@events.select { |event| event.start_time > DateTime.now }.sort_by(&:start_time) - @events_today).first(16)
    @events_diff = (@events - @events_recent - @events_coming_up).sample(16)
    # @city = request.location.city
  end

  def members
    @page_name = 'members'
  end

  def about
  end

  def profile
    @accepted_invites = current_user.invites.select { |invite| invite.status == 'accepted' }
  end
end
