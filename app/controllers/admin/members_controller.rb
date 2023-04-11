class Admin::MembersController < ApplicationController
    
  def index
    @members = Member.all
    #byebug
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end
  
  def update
    @member = Member.find(params[:id])
    @member.update(member_params)
    redirect_to admin_members_path(@member.id)
  end
  
private

  def member_params
    params.require(:member).permit(:name, :name_kana, :email, :postal_code, :address, :telephone_number,:is_deleted)
  end

  def correct_member
    @member = Member.find(params[:id])
    redirect_to public_member_path(current_member) unless @member == current_member
  end
end
