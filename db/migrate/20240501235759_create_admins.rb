class CreateAdmins < ActiveRecord::Migration[7.1]
  def change
    create_table :admins do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :branch
      t.string :password_digest
      t.string :role
      t.boolean :enabled

      t.timestamps
    end
  end
end