class RoomsController < InheritedResources::Base
  before_action :set_room, only: [:show, :edit, :update, :destroy]


  def index
    # @rooms = Room.all
    @current_page = params.fetch(:page, 0).to_i
    @rooms = Room.limit(5)
               .offset(5 * params[:page].to_i)
               .order(params.fetch(:sort, :id))
    @rooms = Room.order(:name).page params[:page]
  end

  def show
    # @room = Room.find(params[:id])
  end

  def update
  respond_to do |format|
    if @room.update(room_params)
      format.html { redirect_to @room, notice: 'Room was successfully updated.' }
      format.json { render :show, status: :ok, location: @room }
    else
      format.html { render :edit }
      format.json { render json: @room.errors, status: :unprocessable_entity }
    end
  end
end

  private

    def room_params
      params.require(:room).permit(:name, :location, :description)
    end
end

