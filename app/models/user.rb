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
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


    def to_s
      first_name
    end
end
