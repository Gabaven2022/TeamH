class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to posts_path }
        format.js
      else
        format.js { render :errors}
      end
    end
  end
  def destroy
  end
  def comment_params
    params.require(:comment).permit(:body, :post_id).merge(user_id: current_user.id)
  end
end
