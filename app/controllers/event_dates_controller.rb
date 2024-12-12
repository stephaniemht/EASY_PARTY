class EventDatesController < ApplicationController
  before_action :set_event, only: [:index, :new, :create]

  def index
    @event_dates = @event.event_dates
  end

  def show
    @event_date = EventDate.find(params[:id])
  end

  def new
    @event_date = @event.event_dates.new
  end

  def create
    @event_date = @event.event_dates.new(event_date_params)
    @event_date.event = @event
    @event_date.user = current_user

    if @event_date.save
      redirect_to event_path(@event), notice: 'Date proposée avec succès !'
    else
      render :new
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def event_date_params
    params.require(:event_date).permit(:proposed_date, :event_id, :user_id, :selected)
  end
end
