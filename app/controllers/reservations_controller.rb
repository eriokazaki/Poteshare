class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @reservations = current_user.reservations
  end

  def new
    @user = current_user
    @reservation = Reservation.new
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    @user = current_user
    @room = Room.find(params[:reservation][:room_id])
    if @reservation.start_date. == nil
      redirect_to @room, alert: "開始日を入力してください" and return
    end 
    if @reservation.end_date == nil
      redirect_to @room, alert:"終了日を入力してください" and return
    end
    if @reservation.end_date < @reservation.start_date
      redirect_to @room, alert:"終了日は開始日以降の日付にしてください" and return
    end
    if @reservation.number_of_people == nil
      redirect_to @room, alert:"正しい人数を入力してください" and return
    end
    @total_day = (@reservation.end_date - @reservation.start_date).to_i 
    @total_price = (@total_day * @reservation.number_of_people * @room.single_rate)
  end

  def create
    @room = Room.find(params[:reservation][:room_id])
    @user = User.find_by(params[:reservation][:room_id])
    @reservation = Reservations.new(params.require(:reservation).permit(:start_date, :end-date, :number_of_people, :user_id, :room_id ,:created_at , :updated_at))

    if @reservation.save
      flash[:notice] = "予約に成功しました"
      redirect_to reservations_path (@reservation)
    else
      flash.now[:alert] = "予約に失敗しました"
      render "rooms/show"
    end
  end

  def show
    @user = current_user
    @reservations = Reservation.all
  end

  def edit
    @room = Room.all
    @reservation = Reservation.find(params[:id])
  end

  def update
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:notice] = "予約をキャンセルしました" 
    redirect_to reservations_path
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :number_of_people, :user_id, :room_id , :created_at , :updated_at)
  end

end


   