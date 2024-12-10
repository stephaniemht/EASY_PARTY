class EventsController < ApplicationController

def index
  @events = Event.all
end

def show
  @event = Event.find(params[:id])
end

def new
  @event = Event.new
end

def create
  @event = Event.new(event_params)
  if @event.save
    redirect_to @event, notice: 'Evenement crée avec succès !'
  else
    render :new, status: unprocessable_entity
end

def edit
  @event = Event.find(params[:id])
end

def update
  @event = Event.find(params[:id])
  if @event.update
    redirect_to @event, notice: 'Evenement mis à jour avec succès !'
  else
    render :edit, status: unprocessable_entity
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path, notice: 'Evenement supprimé avec succès !'
  end

  private

  def event_params
    params.require(:event).permit(:name, :address)
end


end
