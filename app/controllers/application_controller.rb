class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  include ApplicationHelper

  # private
  # def must_belong_or_admin
  #   @event = Event.find(params[:id])
  #   redirect_to root_path, flash: { error: "You don't have access to that" } unless
  #     @event.user.id == current_user.id || current_user.admin?
  # end

  # def admin_user
  #   #user has to be admin to view
  #   redirect_to(root_path) unless current_user.admin?
  # end

  # def must_belong_or_admin_pending
  #   @event = Event.find(params[:id])
  #   #if event is not approved
  #   if @event.approved == false
  #     redirect_to root_path, flash: { error: "You don't have access to that" } unless
  #       @event.user.id == current_user.id || current_user.admin?
  #   end
  # end
end
