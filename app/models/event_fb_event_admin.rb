class EventFbEventAdmin < ApplicationRecord
  belongs_to :event
  belongs_to :fb_event_admin
end
