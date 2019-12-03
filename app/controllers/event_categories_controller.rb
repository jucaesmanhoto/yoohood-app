class EventCategoriesController < ApplicationController
  before_action :set_event, only: %i[update destroy]
  def create
    raise
  end

  def update
    # @event.categories = []
    # params[:event][:categories].each do |category|
    #   next if category.empty?

    #   @event.categories << Category.find(category)
    # end
    # raise
    if params[:event][:categories].present? && EventCategory.find_by(event_id: @event.id, category_id: params[:event][:categories])
      respond_to do |format|
        format.html { redirect_to event_path(@event), alert: 'Event already categorized like this' }
        format.js
      end
    else
      EventCategory.create(event_id: @event.id, category_id: params[:event][:categories])
      respond_to do |format|
        format.html { redirect_to event_path(@event) }
        format.js
      end
    end
  end

  def destroy
    event_category = EventCategory.find(params[:id]).destroy
    @category = event_category.category
    respond_to do |format|
        format.html { redirect_to event_path(@event), alert: 'Event category has been deleted' }
        format.js
      end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end
end
