require 'rails_helper'

RSpec.describe RegionsController, type: :controller do
  describe 'as logged out user' do
    let(:user) { create(:user) }

    it {
      expect(get(:index)).to redirect_to new_user_session_path
    }

    it {
      expect(get(:show, params: {id: 1})).to redirect_to new_user_session_path
    }

    it {
      expect(get(:new)).to redirect_to new_user_session_path
    }

    it {
      expect(get(:edit, params: {id: 1})).to redirect_to new_user_session_path
    }

    it {
      expect(patch(:update, params: {id: 1})).to redirect_to new_user_session_path
    }

    it {
      expect(delete(:destroy, params: {id: 1})).to redirect_to new_user_session_path
    }

    it {
      post(:create, params: {region: FactoryBot.attributes_for(:region)})
      expect(response).to redirect_to new_user_session_path
    }
  end

  describe 'as a logged in user' do 
    let(:user) { create(:user)}
    before(:each) {sign_in user}

    it {
      expect(get(:index)).to redirect_to dashboard_path
    }

    it {
      expect(get(:show, params: {id: 1})).to redirect_to dashboard_path
    }

     it {
      expect(get(:new)).to redirect_to dashboard_path
    }

    it {
      expect(get(:edit, params: {id: 1})).to redirect_to dashboard_path
    }

    it { 
      expect(patch(:update, params: {id: 1})).to redirect_to dashboard_path
    }

    it {
      expect(delete(:destroy, params: {id: 1})).to redirect_to dashboard_path
    }

    it {
      post(:create, params: {region: FactoryBot.attributes_for(:region)})
      expect(response).to redirect_to dashboard_path
    }
  end

  describe 'as an admin user' do
    let(:user) { create(:user, :admin)}
    let(:region) { create(:region)}
    before(:each) {sign_in user}

    it {
      expect(get(:index)).to be_successful
    }

    it {
      expect(get(:show, params: { id: region.id})).to be_successful
    }

    it {
      expect(get(:new)).to be_successful
    }

    it {
      expect(get(:edit, params: { id: region.id})).to be_successful
    }

    it {
      expect(patch(:update, params: {id: region.id,  region: FactoryBot.attributes_for(:region)})).to redirect_to region_path(region)
    }

    it {
      region = build(:region, id: 1)
      allow(Region).to receive(:find).and_return(region)
      allow(region).to receive(:update).and_return(false)
      patch(:update, params: {id: region.id, region: FactoryBot.attributes_for(:region)})
      expect(response).to be_successful
    }

    it {
      expect(delete(:destroy, params: {id: region.id})).to redirect_to regions_path
    }

    it {
      post(:create, params: {region: FactoryBot.attributes_for(:region)})
      expect(response).to redirect_to regions_path
    }

    it {
      region = build(:region)
      allow(Region).to receive(:new).and_return(region)
      allow(region).to receive(:save).and_return(false)
      post(:create, params: {region: FactoryBot.attributes_for(:region)})
      expect(response).to be_successful
    }
  end

end
