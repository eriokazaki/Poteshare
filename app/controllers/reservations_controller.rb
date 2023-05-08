class ReservationsController < ApplicationController
    def confirm
      @reservation = Reservation.new(params.permit(:start_date, :end_date, :total_people, :room_id, :user_id))
      
      @room = Room.find(params[:room_id])
      @user = User.find(current_user.id)
      @user_id = current_user.id
  
      @reservation.total_day = @reservation&.sum_of_days
      @reservation.total_fee = @reservation&.sum_of_price
    end
  
    def create
      @reservation = Reservation.new(params.require(:reservation).permit(:start_date, :end_date, :total_people, :total_day, :total_fee, :room_id, :user_id))
      @room = @reservation.room
      @reservation.total_fee = @reservation.sum_of_price
      @user = User.find(current_user.id)
      @user_id = current_user.id
  
      if @reservation.save
        flash[:success] = "予約しました"
        redirect_to controller: :reservations, action: :index
      else
        render "confirm"
      end
    end
    
    def index
      @reservations = current_user.reservations.all
    end
  
    def edit
      @reservation = Reservation.find(params[:id])
    end
  
    def update
      @reservation = Reservation.find(params[:id])
  
      if @reservation.update(reservation_params)
        flash[:notice] = "保存しました。"
        redirect_to controller: :reservations, action: :confirm
      else
        flash[:alert] = "問題が発生しました。"
        render "edit"
      end
    end
  
    def destroy
      @reservation = Reservation.find(params[:id])
      @reservation.destroy
      flash[:notice] = "ユーザーを削除しました"
      redirect_to controller: :reservations, action: :index
    end
  
    private
    def reservation_params
      params.permit(:start_date, :end_date, :total_people, :total_day, :total_fee, :room_id, :user_id)
    end
  end
