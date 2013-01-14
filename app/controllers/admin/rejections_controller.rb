class Admin::RejectionsController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
  end

  def create
    @event = Event.find(params[:event_id])
    @event.approved = false
    @event.set_rejected()
    @text = params[:text]
    @user = User.find_by_id(@event.user_id)
    UserMailer.disapprove_email(@user,@text).deliver
    @event.save!
    redirect_to admin_events_path
  end
end
