class TradesController < ApplicationController
  before_action :set_trade, only: %i[show]
  before_action :set_benefit, only: %i[create]

  def index
    @trades = Trade.all
  end

  def show
  end

  def new
    @benefit = Benefit.find(params[:benefit_id])
    @event = @benefit.event
    @trade = Trade.new
  end

  def create
    @event = @benefit.event
    @trade = Trade.new(trade_params)
    @trade.user = current_user
    @trade.benefit = @benefit
    new_balance = current_user.points - @trade.quantity * @benefit.value_in_points
    if new_balance.negative? || @trade.quantity > @benefit.quantity
      redirect_to event_path(@event), alert: 'Invalid request.'
      return

    end
    current_user.update(points: new_balance)
    @benefit.update(quantity: @benefit.quantity - @trade.quantity)
    if @trade.save
      redirect_to trade_path(@trade)
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def trade_params
    params.require(:trade).permit(:quantity)
  end

  def set_trade
    @trade = Trade.find(params[:id])
  end

  def set_benefit
    @benefit = Benefit.find(params[:benefit_id])
  end
end
