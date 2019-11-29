class TradesController < ApplicationController
  def index
    @trades = Trade.all
  end

  def show

  end

  def new
    @trade = Trade.new
  end

  def create
    @trade = Trade.new(trade_params)
    if @trade.save
      redirect_to root_path
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
    params.require(:trade).permit(:name, :quantity, :value_in_points)
  end
end
