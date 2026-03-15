require 'rails_helper'

RSpec.describe 'Rejecting an organization', type: :feature do
  before do
    @user = create(:user, :admin)
    @organization = create(:organization, status: :submitted)
    sign_in @user
  end

  it "can reject an organization" do
    visit organization_path(@organization)
    fill_in "Rejection Reason", with: "Application does not meet requirements."
    click_on "Reject"

    expect(current_path).to eq organizations_path
    expect(page).to have_content("Organization #{@organization.name} has been rejected.")
    expect(@organization.reload.status).to eq("rejected")
    expect(@organization.rejection_reason).to eq("Application does not meet requirements.")
  end
end