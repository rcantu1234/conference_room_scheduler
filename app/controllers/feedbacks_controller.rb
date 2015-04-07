class FeedbacksController < InheritedResources::Base
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]

  def index
   # @feedbacks = Feedback.all
  #  @meeting = Meeting.find(params[:meeting_id])
   # @user = User.find(params[:user_id])
    @current_page = params.fetch(:page, 0).to_i
    @feedbacks = Feedback.limit(5)
               .offset(5 * params[:page].to_i)
               .order(params.fetch(:sort, :message))
  end

  def show
   # @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)

    respond_to do |format|
      if @feedback.save
        format.html { redirect_to @feedback, notice: 'Feedback was successfully created.' }
        format.json { render :show, status: :created, location: @feedback }
      else
        format.html { render :new }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end


  private

     def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    def feedback_params
      params.require(:feedback).permit(:message, :user_id, :meeting_id)
    end
end

