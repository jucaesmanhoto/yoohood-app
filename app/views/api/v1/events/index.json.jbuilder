json.array! @events do |event|
    json.extract! event, :id, :fb_event_id, :featured, :title, :cover, :description, :start_time, :end_time, :user_id, :ticket_uri, :created_at, :updated_at
  end