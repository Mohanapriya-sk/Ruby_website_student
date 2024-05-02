# app/controllers/users_controller.rb
class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]

  def new
    @countries = ['United States', 'Canada', 'United Kingdom', 'Australia', 'Germany', 'France', 'Japan', 'China', 'India', 'Brazil']
    @user = User.new
  end

  def create
    # Create a new user with form parameters

    @user = User.new(user_params)
    

    if @user.save
      redirect_to root_path, notice: 'User was successfully created.'
    else
      render :new
    end
    # @user = User.new(user_params)
    # if User.exists?(email: user_params[:email])
    #   flash[:alert] = "User with this email is already registered."
    #   redirect_to signup_path
    # else
      
    #   @user.password_digest = BCrypt::Password.create(params[:user][:password])
    #   @user.password = params[:user][:password]
    #   if @user.save
    #     redirect_to root_path, notice: 'User was successfully created.'
    #   else
    #     render :new
    #   end
    # end
  end

  def profile
    @user = current_user
    # Additional logic for profile page
  end

  def expense
     @user = current_user
     @expense = Expense.new
     # @expenses = current_user.expenses
  @expenses = Expense.all
  end

  def expensecategory
    @user = current_user
    @category = ExpenseCategory.new
    @categories = ExpenseCategory.all
     
  
  end
    def generate_password_reset_token
    update(password_reset_token: SecureRandom.urlsafe_base64)
  end

  # Example usage in a controller action
def send_password_reset_email
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


 def admin
    @user = current_user
    @admin = Admin.new
    @admins = Admin.all
     
  end
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :country)
  end

  def require_login
    unless current_user
      flash[:alert] = "Please log in to access this page"
      redirect_to login_path
    end
  end
end
