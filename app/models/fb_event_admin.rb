class FbEventAdmin < ApplicationRecord
  has_many :event_fb_event_admins
  has_many :events, through: :event_fb_event_admins

  validates :fb_user_id, uniqueness: true
end
