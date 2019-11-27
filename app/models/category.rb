class Category < ApplicationRecord
  has_many :events, through: :event_categories, dependent: :destroy
  has_many :event_categories, dependent: :destroy
end
