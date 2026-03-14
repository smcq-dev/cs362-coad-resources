require 'rails_helper'

RSpec.describe 'Releasing a ticket by an', type: :feature do
  before do
    @organization = create(:organization)
    @user = create(:user, :admin)
    @ticket = create(:ticket, organization: @organization)
    sign_in @user
  end

  it "can release a ticket" do
    visit ticket_path(@ticket)
    click_on "Release"
    expect(current_path).to eq(dashboard_path)
  end

end
