class Member::OrdersController < ApplicationController
 
 def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total = 0
 end
 
 def update
    @order = Order.find(params[:id])
    @order.update(status: params[:order][:status])
     @order.save
    redirect_to member_order_path(@order.id)
 end
 
 private
 
 def order_params
  params.require(:order).permit(:payment_method, :postal_code, :address, :name)
 end
end
