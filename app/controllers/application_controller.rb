class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login


 
  private

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to login_path # halts request cycle
    end
  end


  def logged_in?
    s = session[:account_id]
    if s
      Account.find(s)
    else
      false
    end
  end

  def current_account
    @current_account ||= Account.find(session[:account_id])
  end

end