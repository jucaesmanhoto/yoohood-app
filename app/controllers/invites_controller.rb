class InvitesController < ApplicationController
  def create
    @invite = Invite.new(invite_params)
    @invite.user = current_user
    @invite.event = Event.find(params[:event_id])
    if @invite.save
      redirect_to event_path(@invite.event)
    else
      render :new
    end
  end

  private

  def invite_params
    params.require(:invite).permit(:guest_name, :guest_email)
  end
end
