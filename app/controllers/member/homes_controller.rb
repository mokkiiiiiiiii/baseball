class Member::HomesController < ApplicationController
  def top
    @orders = Order.only_member(current_member)
    @reservations = Reservation.joins(:item).where(item: { member_id: current_member.id })
    @total = 0
  end
end