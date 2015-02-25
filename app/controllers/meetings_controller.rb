class MeetingsController < InheritedResources::Base

  def index
    @meetings = Meeting.all
    @room = Room.find(params[:room_id])
    #@feedback = Feedback.find(params[:id])
  end

  def new
    @meeting = Meeting.new
    @user = current_user
    @room = Room.find(params[:room_id])
  end

  def show
    @meeting = Meeting.find(params[:id])
    @room = Room.find(params[:room_id])
  end

  def edit
    @meeting = Meeting.find(params[:id])
    @room = Room.find(params[:room_id])
  end

  def create
    @meeting = Meeting.new(meeting_params)
    #@meeting.user_id = current_user.id
    #@meeting = Meeting.find(params[:user_id])
    #@meeting.room_id = current_user.id
   # user = User.find(params[:user_id])

     respond_to do |format|
      if @meeting.save
       # UserMailer.new_meeting(@meeting).deliver
        format.html { redirect_to room_meetings_path(params[:room_id]), notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @meeting }
      else
        format.html { render :new }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  @meeting = Meeting.find(params[:id])
  @meeting.destroy
  respond_to do |format|
    format.html { redirect_to meetings_url, notice: 'Meeting was successfully destroyed.' }
    format.json { head :no_content }
  end
end

  private

    def meeting_params
      params.require(:meeting).permit(:name, :user_id, :room_id, :start_time, :end_time)
    end
end

