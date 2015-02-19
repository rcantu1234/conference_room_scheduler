class MeetingsController < InheritedResources::Base

  private

    def meeting_params
      params.require(:meeting).permit(:name, :user_id, :room_id)
    end
end

