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
      expect(patch(:activate, params: {id: resource_category.id})).to redirect_to resource_category_path(resource_category)
    }
  end
end
