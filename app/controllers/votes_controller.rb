class VotesController < ApplicationController
  before_action :set_event_date
  before_action :authenticate_user!

  def create
    event_date = EventDate.find(params[:event_date_id])
    if event_date.votes.where(user: current_user).exists?
      redirect_to event_path(event_date.event), alert: "Vous avez déjà voté pour cette date."
    else
      Vote.create!(event_date: event_date, user: current_user)
      redirect_to event_path(event_date.event), notice: "Votre vote a été enregistré avec succès !"
    end
  end

  # def new

  # end

  # private

  # def set_event_date
  #   @event_date = EventDate.find(params[:event_date_id])
  # end
end
