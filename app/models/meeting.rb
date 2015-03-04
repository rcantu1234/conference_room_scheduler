require 'twilio-ruby'

class Meeting < ActiveRecord::Base
  belongs_to :user
  belongs_to :room

  has_many :feedbacks

  validates :start_time, :uniqueness => { :message => " has been taken." }

  def to_s
   # time.truncate(15)
  end

  def self.establish_twilio
    @account_sid = ENV['twilio_account_sid']
    @auth_token = ENV['twilio_auth_token']
    @from_phone_number = ENV['twilio_phone_number']
    @twilio_client = Twilio::REST::Client.new(@account_sid, @auth_token)

  end

  def self.send_reminder_text_message(body)
      @account_sid = ENV['twilio_account_sid']
      @auth_token = ENV['twilio_auth_token']
      @from_phone_number = ENV['twilio_phone_number']

      @twilio_client = Twilio::REST::Client.new(@account_sid, @auth_token)

      @twilio_client.messages.create( to: "512-981-9768",
                                      from: @from_phone_number,
                                      body: body
                                             )
  end
end

def self.phone_call_fun_time
  Meeting.establish_twilio
  @twilio_client.account.calls.create(url: 'http://demo.twilio.com/docs/voice.xml',
                                      from: '@from_phone_number',
                                      to: '(205)807-2847')
end
