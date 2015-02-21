class RoomsController < InheritedResources::Base

  def index
    # @rooms = Room.all
    @current_page = params.fetch(:page, 0).to_i
    @rooms = Room.limit(5)
               .offset(5 * params[:page].to_i)
               .order(params.fetch(:sort, :id))
    @rooms = Room.order(:name).page params[:page]
  end

  private

    def room_params
      params.require(:room).permit(:name, :location, :description)
    end
end

