class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    # Trouver l'event date sur lequel tu cliques
    # créer le vote avec user_id et event_date_id
    event_date = EventDate.find(params[:event_date_id])
    @vote = Vote.new(event_date: event_date, user: current_user)
    authorize @vote
    if event_date.votes.where(user: current_user).exists?
      redirect_to event_path(event_date.event), alert: "Vous avez déjà voté pour cette date."
    else
      if @vote.save!
        respond_to do |format|
          format.turbo_stream do
            render turbo_stream: turbo_stream.replace("vote_#{event_date.id}",
              partial: "events/vote",
              target: "vote_#{event_date.id}",
              locals: { event_date: event_date })
          end
          format.html { redirect_to event_path(event_date.event), notice: "Votre vote a été enregistré avec succès !"}
        end
      else
        render "events/show", status: :unprocessable_entity
      end
    end
  end
end
