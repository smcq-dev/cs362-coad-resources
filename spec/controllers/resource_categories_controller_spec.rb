require 'rails_helper'

RSpec.describe ResourceCategoriesController, type: :controller do

  describe 'as a logged out user' do
    let(:user) { create(:user) }

    it {
      expect(get(:index)).to redirect_to new_user_session_path
    }

    it {
      expect(get(:new)).to redirect_to new_user_session_path
    }

    it {
      expect(patch(:update, params: {id: 1, resource_category: FactoryBot.attributes_for(:resource_category)})).to redirect_to new_user_session_path
    }

    it {
      expect(patch(:activate, params: {id: 1})).to redirect_to new_user_session_path
    }

    it {
      expect(patch(:deactivate, params: {id: 1})).to redirect_to new_user_session_path
    }

    it {
      expect(delete(:destroy, params: {id: 1})).to redirect_to new_user_session_path
    }

    it {
      post(:create, params: {id: 1, resource_category: FactoryBot.attributes_for(:resource_category)})
      expect(response).to redirect_to new_user_session_path
    }
  end

  describe 'as a logged in user' do
    let(:user) { create(:user) }
    before(:each) { sign_in user }

    it {
      expect(get(:index)).to redirect_to dashboard_path
    }

    it {
      expect(get(:new)).to redirect_to dashboard_path
    }

    it {
      expect(patch(:update, params: {id: 1, resource_category: FactoryBot.attributes_for(:resource_category)})).to redirect_to dashboard_path
    }

    it {
      expect(patch(:activate, params: {id: 1})).to redirect_to dashboard_path
    }

    it {
      expect(patch(:deactivate, params: {id: 1})).to redirect_to dashboard_path
    }

    it {
      expect(delete(:destroy, params: {id: 1})).to redirect_to dashboard_path
    }

    it {
      post(:create, params: {id: 1, resource_category: FactoryBot.attributes_for(:resource_category)})
      expect(response).to redirect_to dashboard_path
    }
  end

  describe 'as an admin user' do 
    let(:user) { create(:user, :admin)}
    let(:resource_category) { create(:resource_category)}
    before(:each) {sign_in user}

    it {
      expect(get(:index)).to be_successful
    }

    it {
      expect(get(:new)).to be_successful
    }

    it {
      expect(patch(:update, params: {id: resource_category.id, resource_category: FactoryBot.attributes_for(:resource_category)})).to redirect_to resource_category_path(resource_category) 
    }

    it {
      rc = build(:resource_category, id: 1)
      allow(ResourceCategory).to receive(:find).and_return(rc)
      allow(rc).to receive(:save).and_return(false)
      patch(:update, params: {id: rc.id, resource_category: FactoryBot.attributes_for(:resource_category)})
      expect(response).to be_successful
    }

    it {
      expect(patch(:activate, params: {id: resource_category.id})).to redirect_to resource_category_path(resource_category)
    }

    it {
      rc = build(:resource_category, id: 1)
      allow(ResourceCategory).to receive(:find).and_return(rc)
      allow(rc).to receive(:activate).and_return(false)
      patch(:update, params: {id: rc.id, resource_category: FactoryBot.attributes_for(:resource_category)})
      expect(response).to redirect_to resource_category_path(rc)
    }

    it {
      expect(patch(:deactivate, params: {id: resource_category.id})).to redirect_to resource_category_path(resource_category)
    }

    it {
      expect(delete(:destroy, params: {id: resource_category.id})).to redirect_to resource_categories_path
    }

    it {
      post(:create, params: {id: resource_category.id, resource_category: FactoryBot.attributes_for(:resource_category)})
      expect(response).to redirect_to resource_categories_path
    }

    it {
      rc = build(:resource_category)
      allow(ResourceCategory).to receive(:new).and_return(rc)
      allow(rc).to receive(:save).and_return(false)
      post(:create, params: {id: rc.id, resource_category: FactoryBot.attributes_for(:resource_category)})
      expect(response).to be_successful
    }
  end
end
