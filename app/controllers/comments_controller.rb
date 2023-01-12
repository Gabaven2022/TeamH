class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)
    respond_to do |format|
      format.html { redirect_to posts_path }
      format.js
    end
  end
  def destroy
  end
  def comment_params
    params.require(:comment).permit(:body, :post_id).merge(user_id: current_user.id)
  end
end
