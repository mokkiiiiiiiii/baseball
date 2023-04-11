# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :customer_state, only: [:create]
  
  protected
  # 退会しているかを判断するメソッド
  def customer_state
  ## 【処理内容1】 入力されたemailからアカウントを1件取得
       @customer = Customer.find_by(email: params[:customer][:email])
      ## アカウントを取得できなかった場合、このメソッドを終了する
      return if !@customer
      ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別


      #if @customer.is_deleted
       # redirect_to new_customer_registration_path
      #else
       #  if @customer.valid_password?(params[:customer][:password])
        ## 【処理内容3】
        #redirect_to customer_session_path
        #else
        #redirect_to new_customer_session_path
         #end
      #end
    
      if @customer.is_deleted && @customer.valid_password?(params[:customer][:password])
        #redirect_to customer_session_path
      #else
        redirect_to new_customer_registration_path
      end
      #byebug
  end

  
end
