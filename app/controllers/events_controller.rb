class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @invite = Invite.new
  end

  def new
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
