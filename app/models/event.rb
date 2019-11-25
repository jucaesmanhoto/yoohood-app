class Event < ApplicationRecord
  belongs_to :place
  has_many :benefit
  belongs_to :user
  has_many :invites
end
