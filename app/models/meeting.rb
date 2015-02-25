class Meeting < ActiveRecord::Base
  belongs_to :user
  belongs_to :room

  has_many :feedbacks
end
