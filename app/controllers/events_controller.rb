class EventsController < ApplicationController
  before_filter :signed_in_user

  def index
    @events = Event.all
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

  def edit
    @event = Event.find(params[:id])
  end

  def show
    @event = Event.find(params[:id])
  end

  def update
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

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to @event
  end
end