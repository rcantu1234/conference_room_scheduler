class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :meetings, dependent: :destroy

  validates_presence_of :first_name, :last_name,
    :date_of_birth, :favorite_color

    validates :first_name, :uniqueness => { :message => " has been used."}

   # validates :start_time, :uniqueness => { :message => " has been taken." }
end
