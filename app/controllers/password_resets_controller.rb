# app/controllers/password_resets_controller.rb

class PasswordResetsController < ApplicationController
  def new
    # Render the forgot password form (views/password_resets/new.html.erb)
  end

   def create
    user = User.find_by(email: params[:email])
    if user
      user.generate_password_reset_token
      UserMailer.password_reset_email(user).deliver_now
      flash[:success] = "Password reset instructions sent to #{user.email}."
      redirect_to root_path
    else
      flash[:error] = "Email address not found."
      render :new
    end
  end
end
