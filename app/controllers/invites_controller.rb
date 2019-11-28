class InvitesController < ApplicationController
  def create
    @invite = Invite.new(invite_params)
    @invite.user = current_user
    @invite.event = Event.find(params[:event_id])
    if @invite.save
      redirect_to event_path(@invite.event)
    else
      render :show
    end
  end

  def show

  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_invite
    @invite = Invite.find(params[:id])
  end

  def invite_params
    params.require(:invite).permit(:guest_name, :guest_email)
  end
end
