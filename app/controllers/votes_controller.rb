class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    # Trouver l'event date sur lequel tu cliques
    # créer le vote avec user_id et event_date_id
    event_date = EventDate.find(params[:event_date_id])
    if event_date.votes.where(user: current_user).exists?
      redirect_to event_path(event_date.event), alert: "Vous avez déjà voté pour cette date."
    else
      @vote = Vote.create!(event_date: event_date, user: current_user)
      authorize @vote
      redirect_to event_path(event_date.event), notice: "Votre vote a été enregistré avec succès !"
    end
  end
end
