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
end