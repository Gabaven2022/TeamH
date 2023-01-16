class TextsController < ApplicationController
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

  def place
    @text_date = TextDate.new
    @text_id = params[:id]
  end

  def place_create
    @text_date = TextDate.new(text_date_params)
    if @text_date.save
      redirect_to texts_path, notice: "投稿完了"
    else
      redirect_to place_text_path, notice: "失敗"
    end
  end



  private
  def text_params
    params.require(:text).permit(:text_name, :faculty, :body, :text_image).merge(user_id: current_user.id)
  end
  def text_date_params
    params.require(:text_date).permit(:date1, :date2, :date3, :text_id).merge(user_id: current_user.id)
  end
end
