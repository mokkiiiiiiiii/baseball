class Public::AddressesController < ApplicationController

  def index
    @addresses = Address.where(customer: current_customer)
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save!
    redirect_to public_addresses_path
  end

 private

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end

end
