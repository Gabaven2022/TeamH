class PostsController < ApplicationController

  def index
    @posts = Post.all.order(created_at: "DESC").page(params[:page]).per(5)
    @comment = Comment.new
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
