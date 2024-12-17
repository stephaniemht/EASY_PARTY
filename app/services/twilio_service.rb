require 'twilio-ruby'

class TwilioService
  def initialize
    @client = Twilio::REST::Client.new(ENV.fetch('TWILIO_ACCOUNT_SID', nil), ENV.fetch('TWILIO_AUTH_TOKEN', nil))
  end

  def valid_number?(phone_number)
    parsed_number = Phonelib.parse(phone_number)
    parsed_number.valid? && parsed_number.e164 == phone_number
  end

  def send_sms(to, body)
    client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
    if valid_phone_number?(to)
      client.messages.create(
        from: ENV.fetch('TWILIO_PHONE_NUMBER', nil), # Votre numéro Twilio
        to: to,
        body: body
      )
    else
      Rails.logger.error "Numéro de téléphone invalide: #{to}"
      return false
    end
  rescue Twilio::REST::TwilioError => e
    Rails.logger.error("Twilio Error: #{e.message}")
    false
  end

  private

  def valid_phone_number?(phone_number)
    phone_number.match?(/\A\+?\d{11,15}\z/)
  end

end