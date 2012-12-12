class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    @user = User.new(params[:user])
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

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    #@user.destroy_events()
    @user.destroy
    redirect_to @user
  end
end