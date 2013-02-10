class Admin::ApprovalsController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
  end

  def show
    @event = Event.find(params[:id])
    #@event.approved = true
  end

  def create
    @event = Event.find(params[:event_id])
    @event.approved = true
    @event.enddate = DateTime.now.utc + 15
    @event.save!
    @user = User.find_by_id(@event.user_id)
    UserMailer.approve_email(@user).deliver
    redirect_to admin_events_path
  end
end
