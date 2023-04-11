class Public::ItemsController < ApplicationController
    
  def index
   @items = Item.all
  end

  def show
   @item = Item.find(params[:id])
   @cart_item = CartItem.new
  end
  
  def search
  @section_title = "「#{params[:search]}」の検索結果"
  @items = if params[:search].present?
    Item.where(['name LIKE ? OR introduction LIKE ?',
     "%#{params[:search]}%", "%#{params[:search]}%"])
    else
    Item.none
    end
  end
  
  private
  
  def item_params
   params.require(:item).permit(:name,:introduction,:image,:price)
  end
end
