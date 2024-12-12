class VotesController < ApplicationController
  before_action :set_event_date

  def new

  end

  def create
  
  end


  private

  def set_event_date
    @event_date = EventDate.find(params[:event_date_id])
  end
end
