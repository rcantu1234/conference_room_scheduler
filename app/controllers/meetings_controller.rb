class MeetingsController < InheritedResources::Base
    before_action :set_meeting, only: [:show, :edit, :update, :destroy]


  def index
    #@rooms = Rooms.all
    @room = Room.find(params[:room_id])
    @current_page = params.fetch(:page, 0).to_i
    @meetings = Meeting.limit(5)
               .offset(5 * params[:page].to_i)
               .order(params.fetch(:sort, :name))
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
        format.html { redirect_to room_meeting_path(@room, meeting), notice: 'Meeting was successfully updated.' }
        format.json { render :show, status: :ok, location: @meeting }
      else
        format.html { render :edit }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @meeting = Meeting.new(meeting_params)

     respond_to do |format|
      if @meeting.save
       # UserMailer.new_meeting(@meeting).deliver
            #CREATE TWILIO REMINDER
      Meeting.send_reminder_text_message("Name: #{@meeting.name},
                                       Start Time: #{@meeting.start_time},
                                       End Time: #{@meeting.end_time},
                                       Updated At: #{@meeting.updated_at},
                                       User Name: #{@meeting.user},
                                       Phone Number: #{@meeting.user.phone_number}")
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
      params.require(:meeting).permit(:name, :start_time, :end_time, :user_id, :room_id)
    end
end

