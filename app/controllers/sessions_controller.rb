# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    #if user && user.authenticate(params[:password])
    if user && user.valid_password?(params[:password])
      session[:user_id] = user.id
      redirect_to expensepath_path, notice: "Logged in successfully!"
    else
      Rails.logger.info("Invalid email or password: #{params[:email]}")
      flash[:alert] = "Invalid email or password"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Logged out successfully!"
  end
end
