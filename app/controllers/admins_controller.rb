class AdminsController < ApplicationController
 before_action :set_admin, only: [:edit, :update, :destroy]

  def index
     @user = current_user
    # @admins = current_user.admins
 @admins = Admin.all
    respond_to do |format|
      format.html # Render HTML by default (assuming you have an HTML template)
      format.json { render json: @admins } # Respond with JSON data
    end
  end

  def new
    #@admin = current_user.admins.build
 @user = current_user
    @admin = Expense.new
     puts "New Expense Object Created: #{@admin.inspect}"
  end

  def create
     @user = current_user
    
    @admin = Admin.new(admin_params)
    if @admin.save
      redirect_to admins_path, notice: 'Admin was successfully created.'
      
    else
      render :new
    end
  end

  def edit
  end

  def update
     @user = current_user
    if @admin.update(admin_params)
      redirect_to admins_path, notice: 'Admin was successfully updated.'
    else
      render :new
    end
  end

  def destroy
     @user = current_user
     @admin = Admin.find(params[:id])
  @admin.destroy
  # redirect_to admins_path, notice: 'Expense was successfully deleted.'
  end

def show
  @admin = Admin.find(params[:id])
  render json: @admin
end
  
  private

  def set_admin
    @admin = Admin.find(params[:id])
     
  end

 def admin_params
      params.require(:admin).permit(:first_name, :last_name, :email, :branch, :password, :role, :enabled)
    end
end
