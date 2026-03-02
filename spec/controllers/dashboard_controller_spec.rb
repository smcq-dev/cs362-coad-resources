require 'rails_helper'

RSpec.describe DashboardController, type: :controller do

  describe 'as logged out user' do
    let(:user) { create(:user) }

    it {
      expect(get(:index)).to redirect_to new_user_session_path
    }
  end

  describe 'as a logged in user' do
    let(:user) { create(:user) }
    before(:each) { sign_in user }

    it {
      expect(get(:index)).to be_successful
    }

    it 'uses stubbed dependencies for index' do
      allow(controller).to receive(:status_options).and_return(["Open", "Closed"])
      allow(controller).to receive(:tickets).and_return([])

      get(:index)

      expect(controller).to have_received(:status_options)
      expect(controller).to have_received(:tickets)
      expect(response).to be_successful
    end

    it 'covers the Open tickets branch' do
      get(:index, params: { status: 'Open' })
      expect(response).to be_successful
    end

    it 'covers the Closed tickets branch' do
      get(:index, params: { status: 'Closed' })
      expect(response).to be_successful
    end

    it 'covers the Captured tickets branch' do
      get(:index, params: { status: 'Captured' })
      expect(response).to be_successful
    end
  end

  describe 'as an organization user with an approved organization' do
    let(:organization) { create(:organization).tap { |org| org.approved! } }
    let(:user) { create(:user, role: :organization, organization: organization) }
    before(:each) { sign_in user }

    it {
      expect(get(:index)).to be_successful
    }

    it 'uses stubbed status_options' do
      allow(controller).to receive(:status_options).and_return(["Open", "Closed"])

      get(:index)

      expect(controller).to have_received(:status_options)
      expect(response).to be_successful
    end

    it 'covers the My Captured tickets branch' do
      get(:index, params: { status: 'My Captured' })
      expect(response).to be_successful
    end

    it 'covers the My Closed tickets branch' do
      get(:index, params: { status: 'My Closed' })
      expect(response).to be_successful
    end
  end

  describe 'as an admin user' do
    let(:user) { create(:user, :admin) }
    before(:each) { sign_in user }

    it {
      expect(get(:index)).to be_successful
    }

    it 'uses stubbed status_options' do
      allow(controller).to receive(:status_options).and_return(["Open", "Closed"])

      get(:index)

      expect(controller).to have_received(:status_options)
      expect(response).to be_successful
    end
  end

end