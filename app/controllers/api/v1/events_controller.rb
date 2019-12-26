class Api::V1::EventsController < Api::V1::BaseController
    def index
      @events = policy_scope(Event)
    end
  end