# app/models/expense_category.rb
class ExpenseCategory < ApplicationRecord
  has_many :expenses

  # Validations
  validates :name, presence: true
end