class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :username, null: false
      t.string :password_digest, null: false
      t.string :email, null: false

      t.timestamps null: false
    end
    add_index :accounts, :email, unique: true
    add_index :accounts, :username, unique: true
  end
end



