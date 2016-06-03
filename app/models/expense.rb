class Expense < ActiveRecord::Base

  CATEGORIES = ["Travel", "Meals", "Office supplies", "Other"]

  validates_presence_of :amount
  validates_presence_of :merchant_name
  validates_presence_of :purchased_on
  validates_presence_of :category
  validates_presence_of :description

  belongs_to :account

  mount_uploader :receipt, ReceiptUploader

end
