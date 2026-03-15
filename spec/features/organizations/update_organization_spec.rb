require 'rails_helper'

RSpec.describe 'Updating an organization', type: :feature do
  before do
    @organization = create(:organization, status: :approved)
    @user = create(:user)
    @user.update(organization: @organization)
    sign_in @user
  end

  it "can update an organization" do
    visit edit_organization_path(@organization)

    fill_in "Name", with: "Updated Organization"
    fill_in "Phone", with: "444-444-4444"
    fill_in "Description", with: "Updated description."

    click_on "Update Resource"

    expect(current_path).to eq organization_path(@organization)
    expect(@organization.reload.name).to eq("Updated Organization")
    expect(@organization.phone).to eq("444-444-4444")
    expect(@organization.description).to eq("Updated description.")
  end
end