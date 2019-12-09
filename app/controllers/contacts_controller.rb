class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.send_contact_mail(@contact.email)
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :subject, :content)
  end
end
