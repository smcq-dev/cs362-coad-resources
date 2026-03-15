require 'rails_helper'

RSpec.describe 'Approving an organization', type: :feature do
  before do
    @user = create(:user, :admin)
    @organization = create(:organization, status: :submitted)
    sign_in @user
  end

  it "can approve an organization" do
    visit organization_path(@organization)
    click_on "Approve"

    expect(current_path).to eq organizations_path
    expect(page).to have_content("Organization #{@organization.name} has been approved.")
    expect(@organization.reload.status).to eq("approved")
  end
end