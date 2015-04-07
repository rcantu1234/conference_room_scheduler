class Feedback < ActiveRecord::Base

  validates_presence_of :message, :user, :meeting

  validates :user, :presence => { :message => " has been used."}

  validates :meeting, :presence => { :message => "Need to enter meeting."}

  validates_length_of :message, minimum: 3, maximum: 200

  belongs_to :meeting
  belongs_to :user

end
