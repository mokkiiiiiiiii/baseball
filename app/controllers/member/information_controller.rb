class Member::InformationController < ApplicationController
 before_action :current_member, only: [:edit, :update]

  def show
    @member = current_member
  end

  def edit
    @member = current_member
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      flash[:success] = "会員情報を編集しました"
      redirect_to member_information_path(@member.id)
    else
      flash.now[:denger] = "会員情報編集に失敗しました"
      render :edit
    end
  end
  
  def check
    @member = current_member
  end
  
  def withdraw
    @member = current_member
    @member.update(is_deleted: "true")
    reset_session
    redirect_to public_root_path
  end

private

  def member_params
    params.require(:member).permit(:name, :name_kana, :email, :postal_code, :address, :telephone_number,:active)
  end

  def correct_member
    @member = Member.find(params[:id])
    redirect_to admin_members_path(current_member) unless @member == current_member
  end
end