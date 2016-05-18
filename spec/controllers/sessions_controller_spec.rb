require "rails_helper"

describe SessionsController do
  
  render_views
  
  describe "create" do

    it "logs you in" do
      account = Account.create!(:email => "katya@example.com", :username => "katya", :password => "poop")
      post :create, {:session => {:username => "katya", :password => "poop"}}
      expect(response).to redirect_to root_path
      expect(session[:account_id]).to eq(account.id)
    end

    it "doesn't log you in when you have an incorrect password" do 
      account = Account.create!(:email => "katya@example.com", :username => "katya", :password => "poop")
      post :create, {:session => {:username => "katya", :password => "pee"}}
      expect(response).to render_template :new
    end

    it "doesn't log you in when you have an incorrect username" do
      account = Account.create!(:email => "katya@example.com", :username => "katya", :password => "poop")
      post :create, {:session => {:username => "iain", :password => "poop"}}
      expect(response).to render_template :new
    end


  end

  describe "new" do
  
    it "shows you the blank form" do
      get :new
      expect(response).to render_template :new
    end
  end


end