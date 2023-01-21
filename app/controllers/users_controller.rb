class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to root_path, alert: "不正なアクセスです。"
    end
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "更新しました"
    end
  end

  def edit_image
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to root_path, alert: "不正なアクセスです。"
    end
  end

  def add_image
    @user = User.find(params[:id])
    if @user.update(profile_image_params)
      redirect_to user_path(@user), notice: "更新しました"
    else
      redirect_to root_path, alert: "不正なアクセスです"
    end
  end

  def user_point
    @user = User.find(params[:id])
    if @user = current_user
      @user.increment(:point, 500)
      @user.save
      redirect_to user_path(current_user), notice: "500p 購入しました"
    else
      redirect_to user_path(current_user)
    end
  end

  def follows
    user = User.find(params[:id])
    @users = user.following_user.page(params[:page]).per(3).reverse_order
  end

  def followers
    user = User.find(params[:id])
    @users = user.follower_user.page(params[:page]).per(3).reverse_order
  end

  private
  def user_params
    params.require(:user).permit(:username, :faculty, :profile_image)
  end
  def profile_image_params
    params.require(:user).permit(:profile_image, :faculty)
  end
end
