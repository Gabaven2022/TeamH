class RoomsController < ApplicationController
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
