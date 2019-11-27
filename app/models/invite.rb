class Invite < ApplicationRecord
  after_create :send_invite_mail

  belongs_to :event
  belongs_to :user

  private

  def send_invite_mail
    InviteMailer.with(invite: self).invitation.deliver_now
  end
end
