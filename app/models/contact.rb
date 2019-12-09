class Contact < ApplicationRecord
  validates :name, :email, :subject, :content, presence: true
  validates :content, length: { minimum: 10,
                                too_short: "%{count} characters is the minimum allowed" }

  def send_contact_mail(email)
    ContactMailer.with(contact: self).contact(email).deliver_now
  end
end
