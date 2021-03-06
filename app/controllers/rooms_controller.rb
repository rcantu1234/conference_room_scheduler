class RoomsController < InheritedResources::Base
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  def index
    @meetings = Meeting.all
    @current_page = params.fetch(:page, 0).to_i
    @rooms = Room.limit(5)
               .offset(5 * params[:page].to_i)
               .order(params.fetch(:sort, :name))
  end

  def show
    @room = Room.find(params[:id])
    @meetings = Meeting.all
  end

  def create
    @room = Room.create(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
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

  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_room
      @room = Room.find(params[:id])
    end

    def room_params
      params.require(:room).permit(:name, :location, :description, :photo)
    end
end

