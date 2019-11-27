class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username photo])
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  # def pull_fb_events(access_token)
  #   url = "https://graph.facebook.com/v4.0/me?fields=events.limit(100){cover,description,end_time,event_times,name,place,start_time,ticket_uri,type,admins}&access_token=#{access_token}"
  #   serialized = open(url).read
  #   @events = JSON.parse(serialized)['events']['data']
  # end

end
