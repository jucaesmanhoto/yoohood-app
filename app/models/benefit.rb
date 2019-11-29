class Benefit < ApplicationRecord
  belongs_to :event
  has_many :trades
  has_many :users, through: :trades

  validates :name, :quantity, :value_in_points, presence: true
  validates :quantity, numericality: {
    only_integer: true, greater_than: 0
  }
  validates :value_in_points, numericality: {
    only_integer: true, greater_than: 0
  }, inclusion: {
    in: (1..10).map { |n| n * 500 },
    message: "%{value} is not a valid number of points"
  }
end
