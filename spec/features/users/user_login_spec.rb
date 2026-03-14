require 'rails_helper'
 
RSpec.describe 'Logging in', type: :feature do
  before do
    @user = create(:user)
  end
 
  it "can log in with valid credentials" do
 
    visit login_path
    fill_in "Email", with: @user.email
    fill_in "Password", with: "password123"
    click_on "Sign in"
 
    expect(current_path).to eq dashboard_path
 
  end
end
 