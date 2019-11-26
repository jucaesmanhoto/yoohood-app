class Place < ApplicationRecord
  has_many :events
  mount_uploader :front_picture, PhotoUploader
  geocoded_by :address

  validates :name, :address, presence: true
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_city_and_zip_code,
                  against: %i[city zip_code],
                  using: {
                    tsearch: { prefix: true } # <-- now `superman batm` will return something!
                  }
end
