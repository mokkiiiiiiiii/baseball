class Member::OrdersController < ApplicationController
 
 def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total = 0
 end
 
 private
 
 def order_params
  params.require(:order).permit(:payment_method, :postal_code, :address, :name)
 end
end
