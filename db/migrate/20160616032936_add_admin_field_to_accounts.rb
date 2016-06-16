class AddAdminFieldToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :admin, :boolean, default: false, null: false
  end
end
