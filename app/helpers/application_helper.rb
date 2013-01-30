module ApplicationHelper
# private
#   def must_be_self_or_admin
#     @user = User.find(params[:id])
#     redirect_to root_path, flash: { error: "You don't have access to that" } unless
#       @user == current_user || current_user.admin?
# end

private
  def must_belong_or_admin
    @event = Event.find(params[:id])
    redirect_to root_path, flash: { error: "You don't have access to that" } unless
      @event.user.id == current_user.id || current_user.admin?
  end

  def admin_user
    #user has to be admin to view
    redirect_to(root_path) unless current_user.admin?
  end

  def must_belong_or_admin_pending
    @event = Event.find(params[:id])
    #if event is not approved
    if @event.approved == false
      redirect_to root_path, flash: { error: "You don't have access to that" } unless
        @event.user.id == current_user.id || current_user.admin?
    end
  end

  def must_be_self_or_admin
      @user = User.find(params[:id])
      redirect_to root_path, flash: { error: "You don't have access to that" } unless
        @user == current_user || current_user.admin?
  end

  def admin_user
    #user has to be admin to view
    redirect_to root_path, flash: { error: "You don't have access to that" }  unless 
    current_user.admin?
  end

  def confirmed_user
    unless (signed_in? && confirmed?)
      store_location
      redirect_to signin_path, notice: "Please sign in (or confirm your email address)" 
    end
  end

end
