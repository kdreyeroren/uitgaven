class SessionsController < ApplicationController

  skip_before_action :require_login, only: [:new, :create]

  def new
    @session = Session.new
  end

  def create
    account = Account.find_by_username(params[:session][:username])
    if account
      password_correct = account.authenticate(params[:session][:password])
      if password_correct
        session[:account_id] = account.id
        redirect_to root_path
      else
        flash.now[:notice] = 'Invalid email or password'
        new
        render :new
      end
    else
      flash.now[:notice] = 'Invalid email or password'
      new
      render :new 
    end
  end

  def destroy
    session.delete(:account_id)
    redirect_to root_path
  end


end
