class Feedback < ActiveRecord::Base

  validates_presence_of :message, :user, :meeting

  validates :user, :uniqueness => { :message => " has been used."}

  validates :meeting, :uniqueness => { :message => "Need to enter meeting."}


  belongs_to :meeting
  belongs_to :user

end
