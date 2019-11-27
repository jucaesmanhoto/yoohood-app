class Event < ApplicationRecord
  has_many :places
  has_many :benefits
  belongs_to :user
  has_many :invites

  include PgSearch::Model
  pg_search_scope :search_by_event_and_artist,
                  against: %i[title description],
                  using: {
                    tsearch: { prefix: true } # <-- now `superman batm` will return something!
                  }
  # pg_search_scope :search_by_city_and_zip_code,
  #                 associated_against: { places: %i[city] },
  #                 using: {
  #                   tsearch: { prefix: true } # <-- now `superman batm` will return something!
  #                 }
end
