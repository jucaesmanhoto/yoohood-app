json.extract! @event, :id, :fb_event_id, :featured, :title, :cover, :description
json.places @event.places do |place|
  json.extract! place, :id, :name, :address, :city, :state, :country, :zipcode, :latitude, :longitude, :capacity, :event_id, :front_picture, :created_at, :updated_at
end
json.extract! @event, :start_time, :end_time, :user_id, :ticket_uri, :created_at, :updated_at