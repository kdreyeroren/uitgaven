class SessionsController < ApplicationController

  skip_before_action :require_login, only: [:new, :create]

  def new
    @session = Session.new
  end

  def create
    @session = Session.new(params[:session][:username], params[:session][:password])
    if @session.can_login?
      session[:account_id] = @session.account.id
      redirect_to root_path
    else
      flash.now[:alert] = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    session.delete(:account_id)
    redirect_to root_path
  end


end
