class Public::ReservationsController < ApplicationController
  
  def new
    @reservation = Reservation.new
    @item = Item.find(params[:item_id])
  end

  def check
    @reservation = Reservation.new(reservation_params)
    @item = Item.find(params[:item_id])
    @reservation.item_id = @item.id
    @reservation.customer_id = current_customer.id
		if @reservation.invalid?
			render :new
		end
  end

  def complete
  end

  def create
    @reservation = current_customer.reservations.build(reservation_params)
    @reservation.item_id = Item.find(params[:item_id]).id
    @reservation.customer_id = current_customer.id
    if params[:back_to_new].present?
      render :new
    elsif @reservation.save
    #current_customer.reservations.destroy_all
      flash[:notice] = "success"
      redirect_to public_reservations_complete_path
    else
      flash.now[:alert] = "faild"
      render :new
    end
  end

  def index
    @reservations = current_customer.reservations.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  private
  def reservation_params
    params.require(:reservation).permit(:postal_code, :address, :name)
  end
end