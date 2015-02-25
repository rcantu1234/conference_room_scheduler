class CommentsController < InheritedResources::Base

  private

    def comment_params
      params.require(:comment).permit(:message, :user_id, :meeting_id)
    end
end

