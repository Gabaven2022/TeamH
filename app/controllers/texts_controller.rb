class TextsController < ApplicationController
  before_action :authenticate_user!
  def home

  end

  def text_index
    @texts = Text.where(faculty: params[:id]).order(created_at: "desc")
  end

  def index
    @texts = Text.all.order(created_at: "desc")
  end

  def new
    @text = Text.new
  end
  def create
    @text = Text.new(text_params)
    if @text.save
      redirect_to texts_path, notice: "投稿完了"
    else
      render :new, alert: "失敗"
    end
  end

  def show
    @text = Text.find(params[:id])
  end
  def confirm
    @text = Text.find(params[:id])
  end

  def text_buy
    @text = Text.find(params[:id])
    if @text.state != 1
      @buy = TextDate.create(buyer_id: current_user.id, user_id: @text.user_id, text_id: params[:id])
      if @buy.save
        @text.update(state: 1)
        @user = User.find(current_user.id)
        @user.increment(:point, -1000)
        @user.save
        redirect_to date_text_path(@text), notice: "1000pで購入しました❕"
      else
        redirect_to text_path(params[:id])
      end
    elsif @text.state==1 && @text.text_date.buyer_id == current_user.id
      redirect_to date_text_path(@text)
    else
      redirect_to text_path(params[:id]), alert: "失敗"
    end
  end

  def date
    @text_date = TextDate.find_by(text_id: params[:id])
    if @text_date.buyer_id != current_user.id
      redirect_to text_path, alert: "失敗"
    end
  end


  def date_create
    @text_date = TextDate.find(params[:id])
    if @text_date.update(text_date_params)
      redirect_to texts_path, notice: "完了"
    else
      redirect_to date_text_path, alert: "失敗"
    end
  end



  private
  def text_params
    params.require(:text).permit(:text_name, :faculty, :body, :text_image).merge(user_id: current_user.id)
  end
  def text_date_params
    params.require(:text_date).permit(:date1, :date2, :date3)
  end
end
