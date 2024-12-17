class EventsController < ApplicationController
  def index
    @events = Event.where(user: current_user)
    @events += Event.joins(:event_registered_users).where(event_registered_users: { user: current_user, status: ["En attente", "Accepté"] })
  end

  def show
    @event = Event.find(params[:id])
    authorize @event
    @items = @event.items
    @events = Event.all
    @markers = @events.geocoded.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        info_window_html: render_to_string(partial: "info_windows", locals: {event: event})
      }
    end
  end

  def new
    @event = Event.new
    @event_dates = []
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    @proposed_dates = params[:event_dates][:proposed_date].split(",")
    authorize @event
    if @event.save!
      @event.create_album
      if @proposed_dates.length <= 1
        @event.update!(date_fixed: @proposed_dates[0])
      else
        @proposed_dates.each do |proposed_date|
          EventDate.create!(proposed_date: proposed_date, event_id: @event.id, user_id: current_user.id)
        end
      end
      if @event.ask_for_participation == 'Items'
        Item.create!(content: params[:item][:content], user_id: current_user.id, event_id: @event.id)
      end
      if @event.ask_for_participation == 'Jackpot'
        Jackpot.create!(event: @event, amount_per_person: params[:event][:amount_per_person], total: 0)
      end
      redirect_to event_path(@event), notice: 'Evenement et album créés avec succès !'
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
      if params[:event][:ask_for_participation] == "0" && @event.jackpot
        @event.jackpot.destroy
      end
      if params[:item][:content] != ""
        Item.create!(content: params[:item][:content], user_id: current_user.id, event_id: @event.id)
      end
      if params[:event][:ask_for_participation] == "1" && @event.jackpot.nil?
        Jackpot.create!(event: @event, amount_per_person: params[:event][:amount_per_person], total: 0)
        @event.items.destroy_all
      end

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

  def duplicate
    @event = Event.find(params[:id])
    authorize @event
    @new_event = @event.dup
    @new_event.user = current_user
    @new_event.save!
    @event.event_dates.each do |event_date|
      EventDate.create!(proposed_date: event_date.proposed_date, event_id: @new_event.id, user_id: current_user.id)
    end
    @event.items.each do |item|
      Item.create!(content: item.content, user_id: current_user.id, event_id: @new_event.id)
    end
    redirect_to event_path(@new_event), notice: 'Evenement dupliqué avec succès !'
  end

  private

  def event_params
    params.require(:event).permit(
      :name,
      :address,
      :description,
      :ask_for_participation,
      :album_id,
      :date_fixed,
    )
  end
end
