require 'rails_helper'

RSpec.describe 'Capturing a ticket', type: :feature do
  before do 
    @organization = create(:organization)
    @user = create(:user, organization: @organization)
    @organization.update(status: 'approved')

    @ticket = create(:ticket)
    sign_in @user
  end

  it 'can capture a ticket' do
    visit ticket_path(@ticket)
    click_on "Capture"
    expect(current_path).to eq(dashboard_path)
  end

end
