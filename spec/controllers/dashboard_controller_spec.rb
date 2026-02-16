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

    it {
      expect(controller).to receive(:status_options).and_call_original
      expect(controller).to receive(:tickets).and_call_original
      get(:index)
    }
  end

  describe 'as an organization user with an approved organization' do
    let(:organization) { create(:organization).tap { |org| org.approved! } }
    let(:user) { create(:user, role: :organization, organization: organization) }
    before(:each) { sign_in user }

    it {
      expect(get(:index)).to be_successful
    }

    it {
      expect(controller).to receive(:status_options).and_call_original
      get(:index)
    }
  end

  describe 'as an admin user' do
    let(:user) { create(:user, :admin) }
    before(:each) { sign_in user }

    it {
      expect(get(:index)).to be_successful
    }

    it {
      expect(controller).to receive(:status_options).and_call_original
      get(:index)
    }
  end

end