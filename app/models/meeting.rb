class Meeting < ActiveRecord::Base
  belongs_to :user
  belongs_to :room

  has_many :feedbacks

  validates :start_time, :uniqueness => { :message => " has been taken." }


  def to_s
   # time.truncate(15)
  end
end
