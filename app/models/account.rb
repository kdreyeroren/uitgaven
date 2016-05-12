class Account < ActiveRecord::Base
  has_secure_password
  validates_presence_of :username
  validates_presence_of :email
  validates_presence_of :password
  validates_uniqueness_of :username
  validates_uniqueness_of :email
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
end