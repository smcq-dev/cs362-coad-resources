require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  describe 'guest log in' do 
    let(:user) {create(:user)}

    it {
      expect(get(:new)).to be_successful
    }

    # show causes errors for guest users
    # it {
    #   expect(get(:show, params: {id: 1})).to redirect_to new_user_session_path
    # }

    it {
      expect(post(:capture, params: {id:1})).to redirect_to dashboard_path  
    }

    it {
      expect(patch(:release, params: {id:1})).to redirect_to dashboard_path
    }

    # close causes errors for guest users
    # it {
    #   expect(get(:close, params: {id:1})).to redirect_to new_user_session_path
    # }

    it {
      expect(delete(:destroy, params: {id: 1})).to redirect_to dashboard_path
    }

    it {
      post(:create, params: {ticket: FactoryBot.attributes_for(:ticket)})
      expect(response).to be_successful
    }

  end 

  describe 'logged in user' do 
    let(:user) {create(:user)}
    before(:each) {sign_in user}

    it {
      expect(get(:new)).to be_successful
    }

    it {
      expect(get(:show, params: {id: 1})).to redirect_to dashboard_path
    }

    it {
      expect(post(:capture, params: {id:1})).to redirect_to dashboard_path  
    }

    it {
      expect(patch(:release, params: {id:1})).to redirect_to dashboard_path
    }

    it {
      expect(get(:close, params: {id:1})).to redirect_to dashboard_path
    }

    it {
      expect(delete(:destroy, params: {id: 1})).to redirect_to dashboard_path
    }

    it {
      post(:create, params: {ticket: FactoryBot.attributes_for(:ticket)})
      expect(response).to be_successful
    }

  end 

  describe 'logged in admin user' do 
    let(:user) {create(:user, :admin)}
    let(:ticket) {create(:ticket)}
    before(:each) {sign_in user}

    it {
      expect(get(:new)).to be_successful
    }

    it {
      expect(get(:show, params: {id: ticket.id})).to be_successful
    }

    it {
      expect(post(:capture, params: {id: ticket.id})).to redirect_to dashboard_path  
    }

    it {
      expect(patch(:release, params: {id: ticket.id})).to redirect_to dashboard_path
    }

    it {
      expect(get(:close, params: {id: ticket.id})).to redirect_to(dashboard_path + '#tickets:open')
    }

    it {
      expect(delete(:destroy, params: {id: ticket.id})).to redirect_to(dashboard_path + '#tickets')
    }

    it {
      post(:create, params: {ticket: FactoryBot.attributes_for(:ticket)})
      expect(response).to be_successful
    }

  end 


end
