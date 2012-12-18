class PaymentsController < ApplicationController

  before_filter :admin_user, only: [:index, :edit, :update, :destroy]

  def index #admin
    #@payments = Payment.all
    @event = Event.find(params[:event_id])
    @payments = @event.payments
  end

  def create
    @event = Event.find(params[:event_id])
    #@payment = Payment.new(params[:payment])
    @payment = @event.payments.build(params[:payment])
    if @payment.save_with_payment
      UserMailer.payment_email(@payment).deliver
      redirect_to event_payment_path(@event, @payment)
    else
      render :new
    end
  end

  def new
    #@payment = Payment.new
    @event = Event.find(params[:event_id])
    @payment = @event.payments.build
  end

  def edit
  end

  def show
    @payment = Payment.find(params[:id])
  end

  def update #admin
    @payment = Payment.find(params[:id])
    if @payment.update_attributes(params[:payment])
      flash[:success] = "Profile updated"
      sign_in @payment
      redirect_to @payment
    else
      render 'edit'
    end
  end

  def destroy #admin
    @payment = Payment.find(params[:id])
    #@payment.destroy_events()
    @payment.destroy
    redirect_to @payment
  end
end