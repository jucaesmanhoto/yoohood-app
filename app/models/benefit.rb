class Benefit < ApplicationRecord
  has_one :event
  belongs_to :user
end
