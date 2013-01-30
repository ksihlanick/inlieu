class PaymentsController < ApplicationController

  before_filter :admin_user, only: [:edit, :update, :destroy]

  def index
    #@payments = Payment.all
    @event = Event.find(params[:event_id])
    @payments = @event.payments
  end

  def create
    @event = Event.find(params[:event_id])
    #@payment = Payment.new(params[:payment])
    @payment = @event.payments.build(params[:payment])
    @payment.money_raised = @payment.money_raised * 100
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

  # private
  # def admin_user
  #   #user has to be admin to view
  #   redirect_to(root_path) unless current_user.admin?
  # end

end