class WelcomeController < ApplicationController
  def index
    @users = User.all
    @rooms = Room.all
    @meetings = Meeting.all
    @feedbacks = Feedback.all
  end
end
