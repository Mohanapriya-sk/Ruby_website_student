class CreateExpenses < ActiveRecord::Migration[7.1]
  def change
    create_table :expenses do |t|
      t.string :name
      t.integer :expense_category_id
      t.string :currency
      t.decimal :total
      t.text :description
      t.string :ref

      t.timestamps
    end
  end
end
