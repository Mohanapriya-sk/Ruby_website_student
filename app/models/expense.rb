# app/models/expense.rb
class Expense < ApplicationRecord
  belongs_to :expense_category
  belongs_to :user
 
  # Validations
  validates :name, :expense_category_id, :currency, :total, presence: true
end