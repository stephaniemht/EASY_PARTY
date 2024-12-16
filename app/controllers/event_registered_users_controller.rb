class EventRegisteredUsersController < ApplicationController
  before_action :authorize_event_registered_user, only: [:accept, :decline]
  before_action :set_registration, only: [:accept, :decline]

  # Accepter une invitation
  def accept
    if @registration.update(status: "Accepté")
      flash[:notice] = "Invitation acceptée."
    else
      flash[:alert] = "Impossible d'accepter l'invitation."
    end
    redirect_to @event_registered_user.event
  end

  # Refuser une invitation
  def decline
    if @registration.update(status: "Refusé")
      flash[:notice] = "Invitation refusée."
    else
      flash[:alert] = "Impossible de refuser l'invitation."
    end
    redirect_to @event
  end

  private

  def set_registration
    @registration = EventRegisteredUser.find(params[:id])
  end

  def authorize_event_registered_user
    authorize @event_registered_user
  end
end
