class MeetingsController < InheritedResources::Base

  def index
    @meetings = Meeting.all
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
    @meeting.user_id = current_user.id
    @meeting.room_id = current_user.id

     respond_to do |format|
      if @meeting.save
        format.html { redirect_to room_meetings_path(params[:room_id]), notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @meeting }
      else
        format.html { render :new }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def meeting_params
      params.require(:meeting).permit(:name, :user_id, :room_id)
    end
end

