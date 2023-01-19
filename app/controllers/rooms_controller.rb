class RoomsController < ApplicationController
  before_action :authenticate_user!
  def index
    @rooms = Room.all
  end
  def show
    @user = User
  end
  def create

  end
  def destroy

  end
end
