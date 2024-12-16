class JackpotsController < ApplicationController
  def new
    @jackpot = Jackpot.new
  end

  def create
    @jackpot = Jackpot.new(params[:id])
    @event = Event.find(params[:event_id])
    @jackpot.event = @event
    if @jackpot.save
      redirect_to event_path(@event)
      flash[:notice] = "Cagnotte crée avec succès"
    else
      render :new, alert: "Impossible d'ajouter une cagnotte"
    end
  end
end
