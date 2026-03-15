require 'rails_helper'

RSpec.describe 'Deleting a Resource Category', type: :feature do
  before do
    @user = create(:user, :admin)
    @resource_category = create(:resource_category)
    sign_in @user
  end

  it "can delete a resource category" do
    visit resource_category_path(@resource_category)
    click_on "Delete"
    expect(current_path).to eq resource_categories_path
    expect(page).to have_content("was deleted")
  end
end