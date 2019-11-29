class Event < ApplicationRecord
  has_many :places, dependent: :destroy
  has_many :benefits, dependent: :destroy
  belongs_to :user
  has_many :invites, dependent: :destroy
  has_many :event_categories, dependent: :destroy
  has_many :categories, through: :event_categories, dependent: :destroy
  has_many :event_fb_event_admins
  has_many :fb_event_admins, through: :event_fb_event_admins

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
  accepts_nested_attributes_for :event_categories
  accepts_nested_attributes_for :places
end
