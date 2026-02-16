require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do
  describe 'as logged out user' do 
    let(:user) {create(:user)}

    it {
      expect(get(:index)).to redirect_to new_user_session_path
    }

    it {
      expect(get(:new)).to redirect_to new_user_session_path
    }

    # it {
    #   expect(get(:edit)).to be_successful
    # }

    it {
      expect(put(:update, params: {id: 1})).to redirect_to new_user_session_path
    }

    it {
      expect(post(:approve, params: {id: 1})).to redirect_to new_user_session_path
    }

    it {
      expect(post(:reject, params: {id: 1})).to redirect_to new_user_session_path
    }

    it {
      post(:create, params: {organization: FactoryBot.attributes_for(:organization)})
      expect(response).to redirect_to new_user_session_path

    }
  end 

  describe 'as a logged in user' do 
    let(:user) {create(:user)}
    before(:each) {sign_in user}

    it {
      expect(get(:index)).to be_successful
    }

    it {
      expect(get(:new)).to be_successful
    }

    # it {
    #   expect(get(:edit)).to be_successful
    # }

    it {
      expect(put(:update, params: {id: 1})).to redirect_to dashboard_path
    }

    it {
      expect(post(:approve, params: {id: 1})).to redirect_to dashboard_path
    }

    it {
      expect(post(:reject, params: {id: 1})).to redirect_to dashboard_path
    }

    it {
      create(:user, role: :admin)
      post(:create, params: {organization: FactoryBot.attributes_for(:organization)})
      expect(response).to redirect_to organization_application_submitted_path

    }
  end 

  describe 'as a logged in admin user' do 
    let(:user) {create(:user, :admin)}
    let(:organization) {create(:organization)}
    before(:each) {sign_in user}

    it {
      expect(get(:index)).to be_successful
    }

    it {
      expect(get(:new)).to redirect_to dashboard_path
    }

    # it {
    #   expect(get(:edit)).to be_successful
    # }

    it {
      expect(put(:update, params: {id: organization.id})).to redirect_to dashboard_path
    }

    it {
      expect(post(:approve, params: {id: organization.id})).to redirect_to organizations_path
    }

    it {
      expect(post(:reject, params: {id: organization.id, organization: {rejection_reason: nil}})).to redirect_to organizations_path
    }


    it {
      create(:user, role: :admin)
      post(:create, params: {organization: FactoryBot.attributes_for(:organization)})
      expect(response).to redirect_to dashboard_path

    }
  end 

end
