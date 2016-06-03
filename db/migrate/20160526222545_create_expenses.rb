class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.integer :account_id, null: false
      t.decimal :amount, null: false, precision: 16, scale: 2
      t.string :merchant_name, null: false
      t.date :purchased_on, null: false
      t.string :category, null: false
      t.string :description, null: false
      t.string :receipt
      t.timestamps null: false
    end
    add_index :expenses, :account_id
    add_index :expenses, :category
  end
end
