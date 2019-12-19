class InvitesController < ApplicationController
  before_action :set_locale
  before_action :set_invite, only: %i[show update]

  def generate_token
    char = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
    token = (0...50).map { char[rand(char.length)] }.join
  end

  def create
    @invite = Invite.new(invite_params)
    @invite.user = current_user
    @invite.event = Event.find(params[:event_id])
    if @invite.save
      @invite.update(token: generate_token)
      @invite.send_invite_mail(@invite.guest_email)
      flash[:notice] = "Your invite was sent to #{@invite.guest_email}"
      redirect_to event_path(@invite.event)
    else
      redirect_to event_path(@invite.event), alert: "You've already invited this person."
    end
  end

  def generate
    @invite = Invite.new(user: current_user, event: Event.find(params[:event_id]), token: generate_token)
    if @invite.save
      respond_to do |format|
        format.html { redirect_to event_path(@invite.event) }
        format.js
      end
    else
      redirect_to event_path(@invite.event)
    end
  end
  
  ###########################################################################
  # action created just to test the email front-end
  # def invitation
    # @invite = Invite.all.select { |event| event.status = 'pending'}.sample
  # end
  ############################################################################

  #############################
  # def guest
  #   @invite = Invite.new(invite_params)
  #   @invite.event = Event.find(params[:event_id])
  #   @invite.send_invite_mail(@invite.guest_email)
  #   redirect_to event_path(@invite.event)
  # end

  def new
  end

  def show
    @event = @invite.event
    redirect_to root_path, alert: 'Invalid invite.' unless @invite.token == params[:token]
    redirect_to root_path, alert: 'You cannot accept your own invite.' if @invite.user == current_user
    redirect_to root_path, alert: 'Invite already accepted.' if @invite.status == 'accepted'
  end

  def update
    if @invite.status == 'accepted'
      redirect_to event_path(@invite.event), alert: 'Invite already accepted.'
      return
    end

    @invite.update(status: 'accepted')
    @invite.user.update(points: @invite.user.points + 50)
    redirect_to event_path(@invite.event)
  end

  def set_locale
    I18n.locale = params.fetch(:locale, I18n.default_locale).to_sym
  end

  def default_url_options
    { locale: I18n.locale == I18n.default_locale ? nil : I18n.locale }
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
