require 'rails_helper'

RSpec.describe 'Deleting a Ticket', type: :feature do
  before do
    @user = create(:user, :admin)
    @ticket = create(:ticket)
    sign_in @user
  end

  it "can delete a ticket" do
    visit ticket_path(@ticket)
    click_on "Delete"
    expect(page).to have_content("was deleted")
  end

end
