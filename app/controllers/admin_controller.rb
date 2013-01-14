class AdminController < ApplicationController
  
  before_filter :admin_user

  def index
    @events = Event.where("enddate > ? AND approved = ?", DateTime.now.utc, true)
    @pend_events = Event.where("enddate > ? AND approved = ?", DateTime.now.utc, false)
    @past_events = Event.where("enddate < ?", DateTime.now.utc)
  end

private
  def must_belong_or_admin
    @event = Event.find(params[:id])
    redirect_to root_path, flash: { error: "You don't have access to that" } unless
      @event.user.id == current_user.id || current_user.admin?
  end

  def admin_user
    #user has to be admin to view
    redirect_to root_path, flash: { error: "You don't have access to that" }  unless current_user.admin?
  end

end
