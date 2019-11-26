require 'json'
require 'open-uri'

class FacebookEventsController < ApplicationController
  def index
    access_token = "EAAGcDbKigf8BAEhYYFZBNxbPQyBUHSDCVoMXZA8PPdTHEFld1IdZAvN2dWoXrZCF8y7WQQMLtKrLqVaq2D24kSNo52S5PZAQL551h12ob7DDubVIiS4KSmRI6oTjc2D86inAPqxOO510WxLmH2DpnuTwIJPedcDmDvRx6ZAZCOaABwoZAruo0onCVIoF7eu4hBpJCMZA3ozmroAZDZD"
    url = "https://graph.facebook.com/v4.0/me?fields=events.limit(100){cover,description,end_time,event_times,name,place,start_time,ticket_uri,type,admins}&access_token=#{access_token}"
    serialized = open(url).read
    @events = JSON.parse(serialized)['events']['data']
  end

  def create
    raise
  end

end
