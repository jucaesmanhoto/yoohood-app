class Place < ApplicationRecord
  belongs_to :event
  mount_uploader :front_picture, PhotoUploader
  geocoded_by :address

  validates :name, :latitude, :longitude, presence: true
  # after_validation :geocode, if: :will_save_change_to_address?
end
