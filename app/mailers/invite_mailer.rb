class InviteMailer < ApplicationMailer
  def invitation
    @invite = params[:invite] # Instance variable => available in view
    mail(to: @invite.guest_email, subject: 'You have received a new invitation!')
  end
end
