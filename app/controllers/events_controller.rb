class EventsController < ApplicationController

  #before_filter :signed_in_user, only: [:new, :create, :edit, :update]
  before_filter :confirmed_user, only: [:new, :create, :edit, :update]
  before_filter :must_belong_or_admin, only: [:edit, :update]
  before_filter :must_belong_or_admin_pending, only: [:show]
  before_filter :admin_user, only: [:destroy]

  def index
    @events = Event.where("enddate > ? AND approved = ?", DateTime.now.utc, true)
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
      flash[:success] = "EVENT IS DIFFERENT NOW WOO!!!"
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

# private
#   def must_belong_or_admin
#     @event = Event.find(params[:id])
#     redirect_to root_path, flash: { error: "You don't have access to that" } unless
#       @event.user.id == current_user.id || current_user.admin?
#   end

#   def admin_user
#     #user has to be admin to view
#     redirect_to(root_path) unless current_user.admin?
#   end

#   def must_belong_or_admin_pending
#     @event = Event.find(params[:id])
#     #if event is not approved
#     if @event.approved == false
#       redirect_to root_path, flash: { error: "You don't have access to that" } unless
#         @event.user.id == current_user.id || current_user.admin?
#     end
#   end

end