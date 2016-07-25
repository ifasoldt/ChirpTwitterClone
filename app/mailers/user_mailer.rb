class UserMailer < ApplicationMailer
  default from: "chirp_welcome@example.com"
  def welcome_email(user)
    @user = user
    @url = "https://guarded-bayou-26088.herokuapp.com/"
    mail(to: @user.email, subject:"Welcome to Chirp!")
  end

  def forgot_password_email(user, new_password)
    @user = user
    @url = "https://guarded-bayou-26088.herokuapp.com/"
    @new_password = new_password
    mail(to: @user.email, subject:"Your New Chirp Password")
  end

  def new_follower_email(current_user ,user)
    @current_user = current_user
    @user = user
    @url = "https://guarded-bayou-26088.herokuapp.com/"
    mail(to: @current_user.email, subject:"#{@user.name} is now following you on Chirp!" )
  end
end
