class PaymentsController < ApplicationController
  def index
    @payments = Payment.all
  end

  def create
    @payment = Payment.new(params[:payment])
    if @payment.save_with_payment
      redirect_to @payment, :notice => "Thank you for donating!"
    else
      render :new
    end
  end

  def new
    @payment = Payment.new
  end

  def edit
  end

  def show
    @payment = Payment.find(params[:id])
  end

  def update
    @payment = Payment.find(params[:id])
    if @payment.update_attributes(params[:payment])
      flash[:success] = "Profile updated"
      sign_in @payment
      redirect_to @payment
    else
      render 'edit'
    end
  end

  def destroy
    @payment = Payment.find(params[:id])
    #@payment.destroy_events()
    @payment.destroy
    redirect_to @payment
  end
end