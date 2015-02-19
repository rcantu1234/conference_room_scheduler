class RoomsController < InheritedResources::Base

  private

    def room_params
      params.require(:room).permit(:name, :location, :description)
    end
end

