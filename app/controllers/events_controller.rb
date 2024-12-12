class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    authorize @event
    @items = @event.items

  end

  def new
    @event = Event.new
    @event_dates = []
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if params[:event][:date_option] = "fixed"
      @event.date_fixed = params[:event][:date_fixed]
    else
      params[:event_dates].each do |date|
        @event.event_dates.build(proposed_date: date)
      end
    end
    authorize @event
    if @event.save
      @event.create_album

      if params[:item][:content] != ""
        Item.create!(content: params[:item][:content], user_id: current_user.id, event_id: @event.id)
      end
      if @event.ask_for_participation
        Jackpot.create!(event: @event, amount_per_person: params[:event][:amount_per_person], total: 0)
      end
      redirect_to @event, notice: 'Evenement et album créés avec succès !'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])
    authorize @event
  end

  def update
    @event = Event.find(params[:id])
    authorize @event
    if @event.update(event_params)
      redirect_to @event, notice: 'Evenement mis à jour avec succès !'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    authorize @event
    @event.destroy
    redirect_to events_path, notice: 'Evenement supprimé avec succès !'
  end

  private

  def event_params
    params.require(:event).permit(:name, :address, :description, :date_fixed, :ask_for_participation, :album_id, )
  end
end
