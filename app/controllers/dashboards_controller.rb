class DashboardsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]
  def new
  end

  # def create
  #   access_token = params[:token]
  #   url = "https://graph.facebook.com/v4.0/me?fields=events.limit(100){cover,description,end_time,event_times,name,place,start_time,ticket_uri,type,admins}&access_token=#{access_token}"
  #   serialized = open(url).read
  #   @events = JSON.parse(serialized)['events']['data']
  #   redirect_to fb_events_path
  # end
end
