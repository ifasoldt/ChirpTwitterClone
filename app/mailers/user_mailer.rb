class UserMailer < ApplicationMailer
  default from: "chirp_welcome@example.com"
  def welcome_email(user)
    @user = user
    @url = "http://www.google.com"
    mail(to: @user.email, subject:"Welcome to Chirp!")
  end

  def forgot_password_email(user, new_password)
    @user = user
    @url = "http://www.google.com"
    @new_password = new_password
    mail(to: @user.email, subject:"Your New Chirp Password")
  end
end
