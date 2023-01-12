class PostsController < ApplicationController

  def index
    @posts = Post.all
    @comment = Comment.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice: "投稿完了"
    else
      render :new, alert: "失敗"
    end
  end

  def show

  end
  def edit

  end
  def destroy

  end
  private
  def post_params
    params.require(:post).permit(:body, :image).merge(user_id: current_user.id)
  end
end