class Checkin < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :user, uniqueness: { scope: :event,
                                 message: "Invalid checkin." }
  # validates :review, length: { minimum: 10,
  #   too_short: "%{count} characters is the minimum allowed" }
end
