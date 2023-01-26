class NotificationsController < ApplicationController
  def index
    @texts = Text.where(user_id: current_user.id).where(state: 1)
    @text_dates = TextDate.where(user_id: current_user.id)
  end
end
