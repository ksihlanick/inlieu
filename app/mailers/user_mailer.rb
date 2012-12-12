class UserMailer < ActionMailer::Base
  default :from => "kevin.sihlanick@gmail.com"
 
  def welcome_email(user)
    @user = user
    @url  = "http://example.com/login"
    mail(:to => user.email, :subject => "Welcome to InLieu!")
  end
end