class ContactMailer < ApplicationMailer
  # raise
  def contact(email)
    @contact = params[:contact] # Instance variable => available in view
    mail(from: email, to: 'contactus@yoohood.fun', subject: 'User contact.')
    # This will render a view in `app/views/user_mailer`!
  end
end
