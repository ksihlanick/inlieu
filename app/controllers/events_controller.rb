class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def create
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def show
    @event = Event.find(params[:id])
  end

  def update

  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to @event
  end
end