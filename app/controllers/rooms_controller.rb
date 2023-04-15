class RoomsController < ApplicationController
  before_action :set_current_user

  def index
    @rooms = @user.rooms
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:notice] = "施設の新規登録が完了しました。"
      redirect_to :rooms
    else
      flash[:notice] = "施設の新規登録に失敗しました。"
      render :new
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  private

  def room_params
    params.require(:room).permit(:name,:detail,:price,:address,:image,:user_id)
  end

  def set_current_user
    @user = current_user
  end
end
