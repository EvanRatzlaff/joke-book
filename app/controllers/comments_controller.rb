class CommentsController < ApplicationController

    def create
        @comment = Comment.new(comment_params)
        if comment.save
            redirect_to joke_path(comment.joke)
        else
            redirect_to joke_path(comment.joke)
    end

    private
    def comment_params
        params.require(:comment).permit(:content, :user_id, :joke_id, :room_id, user_attributes: [:username])
    end
end
