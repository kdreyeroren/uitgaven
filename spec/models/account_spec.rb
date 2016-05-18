require "rails_helper"

describe Account do 

  it "requires a username" do 
    # arrange, act, assert
    account = Account.new(
      username: "",
      email: "katya@whatever.com",
      password: "blah",
    )
    expect(account.valid?).to be false
  end

  it "must have unique email" do
    account = Account.create(
      username: "katya",
      email: "katya@whatever.com",
      password: "blah",
    )

    #expect(account.valid?).to be true -- not necessary but a sanity check

    account = Account.new(
      username: "blah",
      email: "katya@whatever.com",
      password: "blah",
    )
    expect(account.valid?).to be false

  end

  it "must have a valid email address" do
    account = Account.new(
      email: "katya",
    )
    account.valid?
    expect(account.errors[:email]).to eq(["is invalid"])
  end



end
