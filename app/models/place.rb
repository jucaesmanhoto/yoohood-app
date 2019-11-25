class Place < ApplicationRecord
  mount_uploader :front_picture, PhotoUploader
  geocoded_by :address

  validates :name, :address, presence: true
  after_validation :geocode, if: :will_save_change_to_address?
end
