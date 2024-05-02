# app/controllers/dashboard_controller.rb
class DashboardController < ApplicationController
  before_action :require_login

  def index
    @user = current_user
  end

  private

  def require_login
    unless current_user
      flash[:alert] = "Please log in to access this page"
      redirect_to login_path
    end
  end
end
