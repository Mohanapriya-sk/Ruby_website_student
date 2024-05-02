# app/mailers/user_mailer.rb

class UserMailer < ApplicationMailer
  def password_reset_email(user)
    @user = user
    @reset_url = edit_password_reset_url(@user.password_reset_token)
    mail(to: @user.email, subject: 'Password Reset Instructions')
  end
end
