require 'rails_helper'
 
RSpec.describe 'User registration', type: :feature do
 
  it "can register a new user" do
 
    visit signup_path
    fill_in "Email", with: "newuser@example.com"
    fill_in "Password", with: "password123"
    fill_in "Password confirmation", with: "password123"
    click_button "Sign up"
 
    expect(current_path).to eq root_path
 
  end
end
 