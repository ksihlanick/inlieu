class UserMailer < ActionMailer::Base
  default :from => "kevin.sihlanick@gmail.com"
 
  def welcome_email(user)
    @user = user
    @url  = "http://example.com/login"
    mail(:to => user.email, :subject => "Welcome to InLieu!")
  end

  def payment_email(payment)
    @payment = payment
    @url  = "http://example.com/login"
    mail(:to => payment.email, :subject => "Thanks for your payment!")
  end

  def approve_email(user)
    @user = user
    mail(:to => @user.email, :subject => "Congrats! Your InLieu Campaign has been approved!")
  end

  def disapprove_email(user,text)
    @user = user
    @text = text;
    mail(:to => @user.email, :subject => "URGENT! Your InLieu Campaign needs you")
  end
end