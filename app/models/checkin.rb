class Checkin < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :user, uniqueness: { scope: :event,
                                 message: "Invalid checkin." }
end
