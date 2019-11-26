class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @page_name = 'Register an event'
    @event = Event.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
