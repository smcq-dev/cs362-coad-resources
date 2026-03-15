require 'rails_helper'

RSpec.describe 'Creating an Organization Application', type: :feature do
  before do
    @user = create(:user)
    @admin = create(:user, :admin)
    sign_in @user
  end

  it "can create an organization application" do
    visit new_organization_application_path

    choose "organization_liability_insurance_true"
    choose "organization_agreement_one_true"
    choose "organization_agreement_two_true"
    choose "organization_agreement_three_true"
    choose "organization_agreement_four_true"
    choose "organization_agreement_five_true"
    choose "organization_agreement_six_true"
    choose "organization_agreement_seven_true"
    choose "organization_agreement_eight_true"
    choose "organization_transportation_yes"

    fill_in "What is your name? (Last, First)", with: "Primary Contact"
    fill_in "Organization Name", with: "Test Organization"
    fill_in "What is your title? (if applicable)", with: "Coordinator"
    fill_in "What is your direct phone number? Cell phone is best.", with: "555-555-5555"
    fill_in "Who may we contact regarding your organization's application if we are unable to reach you?", with: "Secondary Contact"
    fill_in "What is a good secondary phone number we may reach your organization at?", with: "555-555-5556"
    fill_in "What is your Organization's email?", with: "testorg@example.com"
    fill_in "Description", with: "Test organization description."

    click_on "Apply"

    expect(current_path).to eq organization_application_submitted_path
    expect(Organization.last.name).to eq("Test Organization")
    expect(Organization.last.status).to eq("submitted")
    expect(@user.reload.organization).to eq(Organization.last)
  end
end