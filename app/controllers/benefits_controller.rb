class BenefitsController < ApplicationController
  before_action :set_event, only: %i[new create]
  before_action :set_benefit, only: %i[edit update]
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
  end

  def update
    @benefit.update(benefit_params)
    redirect_to benefits_path
  end

  def destroy
    @benefit.destroy
    redirect_to benefits_path
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
end