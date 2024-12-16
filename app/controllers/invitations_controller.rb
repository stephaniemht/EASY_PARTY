class InvitationsController < ApplicationController
  before_action :set_event
  before_action :authorize_event
  before_action :authenticate_user!

  def create
    phone_number = params[:phone_number] || invitation_params[:phone_number]
    invited_user = User.find_by(phone_number: phone_number)

    if invited_user
      if @event.event_registered_users.exists?(user: invited_user)
        flash[:alert] = "Cet utilisateur est déjà invité."
      else
        @event.event_registered_users.create(user: invited_user, status: "En attente")
        send_invitation(invited_user)
        flash[:notice] = "Invitation envoyée avec succès."
      end
    else
      flash[:alert] = "Cet utilisateur n'existe pas."
    end
    redirect_to @event
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def authorize_event
    authorize @event, :create_invitation?
  end

  def valid_phone_number?(phone_number)
    phone_number.match?(/\A\+?\d{11,15}\z/)
  end

  def send_invitation(invited_user)
    body = "Vous êtes invité à l'événement #{@event.name}. Cliquez ici pour accepter : www.easy-party.store/events/#{@event.id}}"
    if TwilioService.new.send_sms(invited_user.phone_number, body)
      flash[:notice] = "Invitation envoyée avec succès."
    else
      flash[:alert] = "Erreur lors de l'envoi de l'invitation."
    end
  end

  def invitation_params
    params.require(:invitation).permit(:phone_number)
  end
end
