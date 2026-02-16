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
end
