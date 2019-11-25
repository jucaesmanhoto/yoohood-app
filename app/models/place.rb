class Place < ApplicationRecord
  mount_uploader :front_picture, PhotoUploader
end
