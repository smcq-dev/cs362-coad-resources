require 'rails_helper'

RSpec.describe 'Closing a ticket', type: :feature do
  before do

    @organization = create(:organization)
    @user = create(:user, :admin)
    @ticket = create(:ticket, organization: @organization)
    sign_in @user

  end

  it "can close a ticket" do

    visit ticket_path(@ticket)
    click_on "Close"
    expect(page).to have_content("Closed")

  end
end
