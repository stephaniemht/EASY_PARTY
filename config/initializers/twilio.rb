require 'rubygems' 
require 'twilio-ruby'

TwilioClient = Twilio::REST::Client.new(
  ENV.fetch('TWILIO_ACCOUNT_SID'),
  ENV.fetch('TWILIO_AUTH_TOKEN')
)




module TwilioSms
  def self.send_text(phone, content) 
    # phone :- phone number to which you want to send sms 
    # content :- Message text which you want to send
    twilio_sid = ENV['TWILIO_ACCOUNT_SID'] # paste twilio sid
    twilio_token = ENV['TWILIO_AUTH_TOKEN'] # paste twilio token
    twilio_phone_number = ENV['TWILIO_PHONE_NUMBER'] # paste twilio number
    begin
      @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

      @twilio_client.api.account.messages.create(
      :from => twilio_phone_number,
      :to => phone,

      )
    rescue Twilio::REST::TwilioError => e
       return e.message
    end
    return "send"
  end
end