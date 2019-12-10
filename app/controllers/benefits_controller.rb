class BenefitsController < ApplicationController
  before_action :set_event, only: %i[new create]
  before_action :set_benefit, only: %i[edit update destroy]
  def index
    @benefits = Benefit.all
  end

  def new
    @benefit = Benefit.new
  end

  def create
    @benefit = Benefit.new(benefit_params)
    @benefit.event = @event
    if @benefit.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def edit
    @event = @benefit.event
    if @benefit.event.user != current_user
      alert "You're not allowed"
      :back
    end
  end

  def update
    @benefit.update(benefit_params)
    redirect_to event_path(@benefit.event)
  end

  def destroy
    @benefit.destroy
    redirect_to event_path(@benefit.event)
  end

  private

  def benefit_params
    params.require(:benefit).permit(:name, :quantity, :value_in_points)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_benefit
    @benefit = Benefit.find(params[:id])
  end

  def list_benefit
    @benefit = Benefit.find(params[:event.id])
  end
end
