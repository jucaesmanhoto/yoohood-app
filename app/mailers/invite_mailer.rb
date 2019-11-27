class InviteMailer < ApplicationMailer
  def invitation
    @invite = params[:invite] # Instance variable => available in view
    mail(to: @invite.guest_email, subject: 'You have received a new invitation!')
    # This will render a view in `app/views/user_mailer`!
  end
end
