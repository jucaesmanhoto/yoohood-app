class ContactMailer < ApplicationMailer
  def contact(email)
    @contact = params[:contact] # Instance variable => available in view
    mail(from: 'ti@yoohood.fun', to: 'ti@yoohood.fun', subject: "Contact from #{email}")
    # This will render a view in `app/views/user_mailer`!
  end
end
