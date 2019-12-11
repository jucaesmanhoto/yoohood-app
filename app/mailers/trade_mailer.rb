class TradeMailer < ApplicationMailer
  def event_admin
    @trade = params[:trade] # Instance variable => available in view
    mail(to: @trade.benefit.event.user.email, subject: 'You have a new guest to your event!')
  end

  def benefit_redeemer
    @trade = params[:trade] # Instance variable => available in view
    mail(to: @trade.user.email, subject: 'Congratulations! You got a new benefit from Yoohood!')
  end
end
