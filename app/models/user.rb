class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :meetings, dependent: :destroy
  has_many :feedbacks
  has_many :posts

  validates_presence_of :first_name, :last_name,
                        :date_of_birth, :favorite_color

  validates :first_name, :uniqueness => { :message => " has been used."}
 # has_attached_file :avatar, :styles => { :medium => "300x300>" }
    #, :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  #validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


  def to_s
    first_name
  end

  def self.establish_twilio
    @account_sid = ENV['twilio_account_sid']
    @auth_token = ENV['twilio_auth_token']
    @from_phone_number = ENV['twilio_phone_number']
    @twilio_client = Twilio::REST::Client.new(@account_sid, @auth_token)
  end

  def self.phone_call_fun_time
  User.establish_twilio
  @twilio_client.account.calls.create(url: 'http://demo.twilio.com/docs/voice.xml',
                                      from: '@from_phone_number',
                                      to: '512-981-9768')

  end
end
