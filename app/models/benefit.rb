class Benefit < ApplicationRecord
  belongs_to :event
  has_many :users, through: :trades

  validates :name, :quantity, :value_in_points, presence: true
  validates :quantity, numericality: { only_integer: true }
  validates :value_in_points, numericality: { only_integer: true }
end
