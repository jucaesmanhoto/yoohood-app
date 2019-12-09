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

  def send_trade_mail_to_event_admin
    TradeMailer.with(trade: self).event_admin.deliver_now
  end

  def send_trade_mail_to_benefit_redeemer
    TradeMailer.with(trade: self).benefit_redeemer.deliver_now
  end
end
