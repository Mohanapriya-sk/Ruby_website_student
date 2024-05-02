class ExpenseCategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]

  def index
    @categories = ExpenseCategory.all
     @user = current_user
    # @expenses = current_user.expenses

    respond_to do |format|
      format.html # Render HTML by default (assuming you have an HTML template)
      format.json { render json: @categories } # Respond with JSON data
    end
  end

 
  def new
    @category = ExpenseCategory.new

     puts "New Expense Object Created: #{@category.inspect}"
  end

  def create
    @user = current_user
    @category = ExpenseCategory.new(category_params)

    if @category.save
      redirect_to @category, notice: 'Expense category was successfully created.'
    else
      render :new
    end


  end

  def edit
  end

  def update
    @user = current_user
    if @category.update(category_params)
      redirect_to expense_categories_path, notice: 'Expense category was successfully updated.'
    else
      render :new
    end

     
  

  end

  def destroy
    
      @user = current_user
     @category = ExpenseCategory.find(params[:id])
  @category.destroy
    # redirect_to expense_categories_url, notice: 'Expense category was successfully deleted.'
  end
def show
  @category = ExpenseCategory.find(params[:id])
  render json: @category
end
  

  private

  def set_category
    @category = ExpenseCategory.find(params[:id])
  end

  def category_params
    params.require(:expense_category).permit(:name, :description, :color, :enabled)
  end
end
