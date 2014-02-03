require_dependency "blorgh/application_controller"

module Blorgh
  class CommentsController < ApplicationController
    def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.create(comments_params)
      flash[:notice] = "Comment has been created!"
      redirect_to posts_path
    end

    private

    def comments_params
      params.require(:comment).permit(:text)
    end

  end
end
