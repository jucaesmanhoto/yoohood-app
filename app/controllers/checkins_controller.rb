class CheckinsController < ApplicationController
  before_action :set_event, only: %i[new create]
  before_action :set_checkin, only: %i[edit update]

  def new
    if Checkin.where(user: current_user).empty? || Checkin.where(event: @event).empty?
      @checkin = Checkin.new
      return
    end
    redirect_to event_path(@event)
    flash[:alert] = "You have already done that."
  end

  def create
    @checkin = Checkin.new(checkin_params)
    @checkin.event = @event
    @checkin.user = current_user

    flash[:alert] = "Try again later." unless @checkin.save
    redirect_to event_path(@event)
  end

  # def edit
  #   @event = @checkin.event
  # end

  # def update
  #   # raise
  #   @checkin.update(checkin_params)
  #   redirect_to event_path(@checkin.event)
  # end

  private

  def checkin_params
    params.require(:checkin).permit(:review, :rating)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_checkin
    @checkin = Checkin.find(params[:id])
  end
end
