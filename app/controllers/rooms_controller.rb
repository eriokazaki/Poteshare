class RoomsController < ApplicationController
  def index
    @user = current_user
    @rooms = current_user.rooms #ログインユーザーの登録施設のみ表示
  end

  def new
    @room = current_user.rooms.build
  end

  def create
    @user = current_user
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    if @room.save
      flash[:notice] = "宿泊施設を登録しました"
      redirect_to @room
    else 
      render :new
    end
  end

  def show
    @user = current_user
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])

    if @room.update(room_params)
      flash[:notice] = "宿泊施設を更新しました"
      redirect_to @room
    else
      render :edit
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "宿泊施設を削除しました"
    redirect_to :rooms
  end
  
  private
  def room_params
    params.require(:room).permit(:name, :introduce, :single_rate, :address, :image, :room_id).merge(user_id: current_user.id)
  end
end
