class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home members]

  def home
    @page_name = 'Find a perfect event'
    @events = Event.all
    events_by_city = params[:city].present? ? Place.near(params[:city], 10).map(&:event) : []
    # @events = @events.search_by_city_and_zip_code(params[:city]) if params[:city].present?
    events_by_title = params[:title_description].present? ? Event.search_by_event_and_artist(params[:title_description]) : []

    @events = (events_by_city + events_by_title).uniq
  end

  def members
    @page_name = 'members'
  end

  def profile
    # @meta_title = "#{DEFAULT_META["meta_product_name"]} - #{current_user.name.split(' ').first}'s profile"
  end
end
