class CheckinsController < ApplicationController
  before_action :set_locale
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

    if @checkin.save
      points_earned = 50
      points_earned += 40 if @checkin.review.size >= 10
      points_earned += 30 if @checkin.rating.present?

      current_user.update(points: current_user.points + points_earned)
      redirect_to event_path(@event)
    else
      flash[:alert] = "Something went wrong. Please, try again."
      render :new
    end
  end

  # def edit
  #   @event = @checkin.event
  # end

  # def update
  #   @checkin.update(checkin_params)
  #   redirect_to event_path(@checkin.event)
  # end

  def set_locale
    I18n.locale = params.fetch(:locale, I18n.default_locale).to_sym
  end

  def default_url_options
    { locale: I18n.locale == I18n.default_locale ? nil : I18n.locale }
  end
  
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
