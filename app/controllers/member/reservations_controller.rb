class Member::ReservationsController < ApplicationController
  def show
    @reservation = Reservation.find(params[:id])
  end
  
  def update
    @reservation = Reservation.find(params[:id])
    @reservation.update(status: params[:reservation][:status])
     @reservation.save
    redirect_to member_reservation_path(@reservation.id)
 end
  
  private
  def reservation_params
    params.require(:reservation).permit(:postal_code, :address, :name)
  end
end
