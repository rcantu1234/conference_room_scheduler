class Meeting < ActiveRecord::Base
  belongs_to :user
  belongs_to :room

  has_many :feedbacks

  def to_s
    time.truncate(15)
  end
end
