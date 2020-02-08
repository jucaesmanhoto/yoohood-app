class ContactsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]

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

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :subject, :content)
  end
end
