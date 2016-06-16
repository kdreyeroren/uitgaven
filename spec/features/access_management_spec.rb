describe "access management" do
  it "prevents access to the accounts path" do
  
    Account.create!(:email => "katya@example.com", :username => "katya", :password => "poop")
    visit "/"
    fill_in 'Username', :with => 'katya'
    fill_in 'Password', :with => 'poop'
    click_button 'Submit'

    visit "/accounts"

#    save_and_open_page

    expect(page).to have_content "Bugger off"

  end

  it "provides access to the accounts path for admins" do
  
    Account.create!(:email => "katya@example.com", :username => "katya", :password => "poop", :admin => true)
    visit "/"
    fill_in 'Username', :with => 'katya'
    fill_in 'Password', :with => 'poop'
    click_button 'Submit'

    visit "/accounts"

    expect(page).to have_content "Listing Accounts"

  end

end
