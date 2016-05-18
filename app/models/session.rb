class Session
  include ActiveModel::Model
  def username
  end
  def password
  end



  def initialize(username = nil, password = nil)
    @username = username
    @password = password
  end

  def can_login?
    username_correct? && password_correct?
  end

  private

# the following methods have to happen in this order, otherwise they don't know what @account is
  def username_correct?
    not account.nil?
  end

  def password_correct?
    account.authenticate(@password)
  end

  public

  def account
    @account ||= Account.find_by_username(@username)
  end

end