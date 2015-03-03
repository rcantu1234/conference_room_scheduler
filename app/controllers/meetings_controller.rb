class MeetingsController < InheritedResources::Base
    before_action :set_meeting, only: [:show, :edit, :update, :destroy]


  def index
    @meetings = Meeting.all
    #@rooms = Rooms.all
    @room = Room.find(params[:room_id])
    @current_page = params.fetch(:page, 0).to_i
    @meetings = Meeting.limit(5)
               .offset(5 * params[:page].to_i)
               .order(params.fetch(:sort, :id))
    @meetings = Meeting.order(:name).page params[:page]
    #@user = User.find(params[:user_id])
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


  def update
    #@meeting = Meeting.new(meeting_params)
    # @meeting = Meeting.find(params[:id])
    # @room = Room.find(params[:room_id])
        respond_to do |format|
      if @meeting.update(meeting_params)
        format.html { redirect_to room_meeting_path(params[:room_id], meeting), notice: 'Meeting was successfully updated.' }
        format.json { render :show, status: :ok, location: @meeting }
      else
        format.html { render :edit }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end


  def create
    @meeting = Meeting.new(meeting_params)
    #@meeting.user_id = current_user.id
    #@meeting = Meeting.find(params[:user_id])
    #@meeting.room_id = current_user.id
   # user = User.find(params[:user_id])

     respond_to do |format|
      if @meeting.save
       UserMailer.new_meeting(@meeting).deliver
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

    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    def meeting_params
      params.require(:meeting).permit(:name, :user_id, :room_id, :start_time, :end_time)
    end
end

