class CreateExpenseCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :expense_categories do |t|
      t.string :name
      t.text :description
      t.string :color
      t.boolean :enabled

      t.timestamps
    end
  end
end
