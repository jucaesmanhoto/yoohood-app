class ContactsController < ApplicationController
  before_action :set_locale

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      @contact.send_contact_mail(@contact.email)
      flash[:notice] = "Thank you for your message."
      redirect_to root_path
    else
      render :new
    end
  end

  def set_locale
    I18n.locale = params.fetch(:locale, I18n.default_locale).to_sym
  end

  def default_url_options
    { locale: I18n.locale == I18n.default_locale ? nil : I18n.locale }
  end
  
  private

  def contact_params
    params.require(:contact).permit(:name, :email, :subject, :content)
  end
end
