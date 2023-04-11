class Member::ItemsController < ApplicationController
    
  def index
    @items = Item.where(member: current_member)
  end

  def new
    @item = Item.new
  end

  def create
    @items = Item.all
    @item = Item.new(item_params)
    @item.member_id = current_member.id
    @item.save
    redirect_to member_items_path(@item.id)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
     @item.save
    redirect_to member_items_path(@item.id)
  end

  private

  def item_params
    params.require(:item).permit(:name,:introduction,:image,:price)
  end
end