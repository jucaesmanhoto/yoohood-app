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
    raise
  end

  def edit
  end

  def update
    @benefit.update(benefit_params)
    redirect_to benefit_path(@benefit)
  end

  def destroy
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
