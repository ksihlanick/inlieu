class ConfirmationsController < ApplicationController
  def new
  end
  def create  
    user = User.find_by_email(params[:email])  
    user.send_password_reset if user  
    redirect_to root_url, :notice => "Email sent with password reset instructions."  
  end  
  def edit  
    @user = User.find_by_confirm_token!(params[:id])  
  end  
  def update
    @user = User.find_by_confirm_token!(params[:id])  
    @user.set_confirmation 
    sign_in @user
    flash[:success] = "Welcome!!"
    redirect_to @user;
    #redirect_to signin_path, :notice => "Password has been reset."    
  end
end
