class RoomsController < InheritedResources::Base

  def index
    @rooms = Room.all
  end

  private

    def room_params
      params.require(:room).permit(:name, :location, :description)
    end
end

