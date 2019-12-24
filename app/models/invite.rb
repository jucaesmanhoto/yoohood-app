class Invite < ApplicationRecord
  # after_create :send_invite_mail

  belongs_to :event
  belongs_to :user

  def send_invite_mail(email)
    InviteMailer.with(invite: self).invitation.deliver_now
  end
end
