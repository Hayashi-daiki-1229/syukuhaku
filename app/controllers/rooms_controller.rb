class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    @q = Room.ransack(params[:q])
    @rooms = @q.result(distinct: true)
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.create(room_params)
    @room.user_id = current_user.id
    if @room.save
      redirect_to room_path(@room)
    else
      render :new
    end
  end

  def show
    @room = Room.find(params[:id])
    @reserve = Reserve.new
  end

  def edit
  end

  private
  def room_params
    params.require(:room).permit(:room_name, :room_detail, :price, :address, :room_img)
  end
end
