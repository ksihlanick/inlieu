module ApplicationHelper
private
  def must_be_self_or_admin
    @user = User.find(params[:id])
    redirect_to root_path, flash: { error: "You don't have access to that" } unless
      @user == current_user || current_user.admin?
end

def admin_user
  #user has to be admin to view
  redirect_to(root_path) unless current_user.admin?
end
  
end
