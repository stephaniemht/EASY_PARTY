class InvitationsController < ApplicationController
  before_action :set_event
  before_action :authorize_event, only: [:create]

  def create
    phone_number = params[:phone_number]

    if valid_phone_number?(phone_number)
      # Créez une instance de TwilioService et envoyez le message
      twilio_service = TwilioService.new
      twilio_service.send_sms(phone_number, "Vous êtes invité à l'événement #{@event.name}! Connectez-vous pour plus de détails : #{@event_url}")

      redirect_to @event, notice: 'L\'invitation a été envoyée.'
    else
      flash[:alert] = "Numéro de téléphone invalide. Veuillez utiliser un numéro international."
      render :new
    end
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
end
