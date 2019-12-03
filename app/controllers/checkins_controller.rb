class CheckinsController < ApplicationController
  before_action :set_event, only: %i[new create]
  # before_action :set_checkin, only: %i[new create]
  def new
    @checkin = Checkin.new
  end

  def create
    @checkin = Checkin.new(checkin_params)
    @checkin.event = @event
    @checkin.user = current_user
    if @checkin.save
      redirect_to new_event_checkin_path(@event)
    else
      # flash[:alert] = "Something went wrong."
      # render :new
    end
  end

  def edit

  end

  def update

  end

  private

  def checkin_params
    params.require(:checkin).permit(:review, :rating)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  # def set_checkin
  #   @checkin = Checkin.find(params[:id])
  # end
end
