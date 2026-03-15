require 'rails_helper'

RSpec.describe 'Creating a Region', type: :feature do
  before do
    @user = create(:user, :admin)
    sign_in @user
  end

  it "can create a region" do
    visit new_region_path
    fill_in "Name", with: "Test Region"
    click_on "Add Region"

    expect(current_path).to eq regions_path
    expect(page).to have_content("Region successfully created.")
  end
end