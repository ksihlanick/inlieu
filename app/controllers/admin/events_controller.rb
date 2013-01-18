class Admin::EventsController < ApplicationController

  before_filter :signed_in_user
  before_filter :admin_user

  def index
    #@events = Event.all
    @events = Event.where("enddate > ? AND approved = ?", DateTime.now.utc, true)
    @pend_events = Event.where("enddate > ? AND approved = ? AND rejected = ?", DateTime.now.utc, false, false)
    @past_events = Event.where("enddate < ?", DateTime.now.utc)
    @rejected_events = Event.where("rejected = ?", true)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new
    @event.set_event_attributes(params[:event])
    @event.user_id = current_user.id
    if @event.save
      flash[:success] = "New Event Created BAM!!!"
      redirect_to @event
    else
      render 'new'
    end
  end

  def edit #should belong to signed in user
    @event = Event.find(params[:id])
  end

  def show
    @event = Event.find(params[:id])
  end

  def update #should belong to signed in user
    @event = Event.find(params[:id])
    @event.set_event_attributes(params[:event])
    @event.user_id = current_user.id
    if @event.save
      flash[:success] = "Your event has been updated!!!"
      redirect_to @event
    else
      render 'new'
    end
  end

  def destroy #should be admin
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to @event
  end

private
  def must_belong_or_admin
    @event = Event.find(params[:id])
    redirect_to root_path, flash: { error: "You don't have access to that" } unless
      @event.user.id == current_user.id || current_user.admin?
  end

  def admin_user
    #user has to be admin to view
    redirect_to root_path, flash: { error: "You don't have access to that" } unless current_user.admin?
  end

end