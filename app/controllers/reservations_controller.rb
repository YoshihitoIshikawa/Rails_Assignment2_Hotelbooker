class ReservationsController < ApplicationController
  before_action :set_current_user
  before_action :authenticate_user!, only: [:confirm]

  def index
    @reservations = @user.reservations
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    @room = @reservation ? @reservation.room : []
    render "rooms/show" if @reservation.invalid?

    if @reservation.check_out != nil && @reservation.check_in != nil
      @number_of_days = ((@reservation.check_out - @reservation.check_in) /60 /60 /24).to_i
      @reservation.number_of_days = @number_of_days
    end

    if @number_of_days != nil && @reservation.number_of_people != nil
      @total_price = (@number_of_days * @reservation.number_of_people * @room.price).to_i
      @reservation.total_price = @total_price
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      flash[:notice] = "施設予約が完了しました。"
      redirect_to :reservations
    else
      flash[:notice] = "施設予約に失敗しました。"
      render "http://127.0.0.1:3000"
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:check_in,:check_out,:number_of_people,:number_of_days,:total_price,:user_id,:room_id)
  end

  def set_current_user
    @user = current_user
  end

  def validation
    @reservation.valid?
  end

  def set_reservation_variable
    @reservation = Reservation.new(reservation_params)
  end
end
