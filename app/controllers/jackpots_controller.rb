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
      flash[:notice] = "Jackpot is added"
    else
      render :new, alert: "Impossible to add jackpot"
    end
  end

end
