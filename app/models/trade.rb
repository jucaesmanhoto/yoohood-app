class Trade < ApplicationRecord
  belongs_to :user
  belongs_to :benefit

  validates :quantity,
            presence: true,
            numericality: {
              only_integer: true,
              greater_than: 0
              # less_than_or_equal_to: current_user.points / value_in_points
            }
end
