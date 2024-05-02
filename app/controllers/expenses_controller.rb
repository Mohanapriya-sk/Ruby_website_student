# app/controllers/expenses_controller.rb
class ExpensesController < ApplicationController
  before_action :set_expense, only: [:edit, :update, :destroy]

  def index
     @user = current_user
    # @expenses = current_user.expenses
 @expenses = Expense.all
  
    respond_to do |format|
      format.html # Render HTML by default (assuming you have an HTML template)
      format.json { render json: @expenses } # Respond with JSON data
    end
  end

  def new
    #@expense = current_user.expenses.build
 @user = current_user
    @expense = Expense.new
     puts "New Expense Object Created: #{@expense.inspect}"
  end

  def create
     @user = current_user
    @expense = current_user.expenses.build(expense_params)
    if @expense.save
      redirect_to expenses_path, notice: 'Expense was successfully created.'
      
    else
      render :new
    end
  end

  def edit
  end

  def update
     @user = current_user
    if @expense.update(expense_params)
      redirect_to expenses_path, notice: 'Expense was successfully updated.'
    else
      render :new
    end
  end

  def destroy
     @user = current_user
     @expense = Expense.find(params[:id])
  @expense.destroy
  # redirect_to expenses_path, notice: 'Expense was successfully deleted.'
  end

def show
  @expense = Expense.find(params[:id])
  render json: @expense
end
  
  private

  def set_expense
    @expense = current_user.expenses.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:name, :expense_category_id, :currency, :total, :description, :ref)
  end
end
