class ReservationsController < ApplicationController
  def index
    redirect_to :action => 'new'
  end
  
  def new
    @reservation = Reservation.new
  end
  
  def create
    @reservation = Reservation.new(reservation_params)
    
    if Reservation.exists?(:rcrd_loc => @reservation.rcrd_loc) || @reservation.save
      redirect_to(:action => 'show', :rcrd_loc => @reservation.rcrd_loc)
    else
      render 'new'
    end

  end
  
  def show
    @reservation = Reservation.find(params[:rcrd_loc])
    @segments = @reservation.segments
  end
  
  def destroy
    Reservation.find(params[:rcrd_loc]).destroy
    flash[:info] = "Reservation removed"
    redirect_to root_path
  end
  
  private
  def reservation_params
    params.require(:reservation).permit(:rcrd_loc, :first_name, :last_name, :email, :a_list)
  end
end
