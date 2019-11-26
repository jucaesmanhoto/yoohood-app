class Event < ApplicationRecord
  has_many :place
  has_many :benefits
  belongs_to :user
  has_many :invites

  # include PgSearch::Model
  # pg_search_scope :search_by_event_and_artist,
  #                 against: %i[title description],
  #                 using: {
  #                   tsearch: { prefix: true } # <-- now `superman batm` will return something!
  #                 }
end
