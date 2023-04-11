class Member::ReservationsController < ApplicationController
  def show
    @reservation = Reservation.find(params[:id])
  end
  
  private
  def reservation_params
    params.require(:reservation).permit(:postal_code, :address, :name)
  end
end
