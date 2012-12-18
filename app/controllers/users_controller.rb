class UsersController < ApplicationController

  before_filter :must_be_self_or_admin, only: [:show, :edit, :update]
  before_filter :admin_user, only: [:index, :destroy]

  def index #must be admin
    @users = User.all
  end

  def create
    #@user = User.new(params[:user])
    @user = User.create
    @user.set_user_attributes(params[:user])
  	if @user.save
      # Tell the UserMailer to send a welcome Email after save
      UserMailer.welcome_email(@user).deliver
      sign_in @user
      flash[:success] = "Welcome!!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def new
  	@user = User.new
  end

  def edit #must be the signed in user or admin
    @user = User.find(params[:id])
  end

  def show #must be THE signed in user or admin
    @user = User.find(params[:id])
  end

  def update #must be THE signed in user or admin 
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy #must be admin
    @user = User.find(params[:id])
    #@user.destroy_events()
    @user.destroy
    redirect_to @user
  end

private
  def must_be_self_or_admin
    @user = User.find(params[:id])
    redirect_to root_path, flash: { error: "You don't have access to that" } unless
      @user == current_user || current_user.admin?
end

def admin_user
  #user has to be admin to view
  redirect_to(root_path) unless current_user.admin?
end
  
end