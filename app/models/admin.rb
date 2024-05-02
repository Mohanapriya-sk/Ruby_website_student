# app/models/admin.rb
class Admin < ApplicationRecord
  # Validations
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  #validates :role, inclusion: { in: %w(accountowner superadmin manager employee) }

  # Associations and secure password
  has_secure_password
end
