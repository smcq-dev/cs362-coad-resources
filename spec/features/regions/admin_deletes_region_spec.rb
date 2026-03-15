require 'rails_helper'

RSpec.describe 'Deleting a Region', type: :feature do
  before do
    @user = create(:user, :admin)
    @region = create(:region)
    sign_in @user
  end

  it "can delete a region" do
    visit region_path(@region)
    click_on "Delete"

    expect(current_path).to eq regions_path
    expect(page).to have_content("was deleted")
  end
end