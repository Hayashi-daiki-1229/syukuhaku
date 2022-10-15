class ReservesController < ApplicationController
  before_action :authenticate_user!

  def index
    @reserves = Reserve.all
    @user = current_user
    @rooms = Room.all  
  end

  def new
    @room = Room.find(params[:reserve][:room_id])
    @reserve = Reserve.new(reserve_params)
    @price = @room.price * @reserve.people * (@reserve.end_date - @reserve.start_date).to_i
    @days =  (@reserve.end_date - @reserve.start_date).to_i
  end

  def create
    @room = Room.find(params[:reserve][:room_id])
    @reserve = Reserve.create(reserve_params)
    @price = @room.price * @reserve.people * (@reserve.end_date - @reserve.start_date).to_i
    if @reserve.save
      @room = Room.find(params[:reserve][:room_id])
      redirect_to reserf_path(@reserve.id)
    else
      render :new
    end
  end

  def show
    @reserve = Reserve.find(params[:id])
    @price = @reserve.room.price * @reserve.people * (@reserve.end_date - @reserve.start_date).to_i

  end

    private
  def reserve_params
    params.require(:reserve).permit(:start_date, :end_date, :people, :room_id, :user_id, :confirming).merge(user_id: current_user.id, room_id: (params[:reserve][:room_id]))
  end

end


