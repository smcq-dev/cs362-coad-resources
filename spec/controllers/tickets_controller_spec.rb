require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  describe 'guest log in' do 
    let(:user) {create(:user)}

    it {
      expect(get(:new)).to be_successful
    }


    it {
      expect(post(:capture, params: {id:1})).to redirect_to dashboard_path  
    }

    it {
      expect(patch(:release, params: {id:1})).to redirect_to dashboard_path
    }


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
    before(:each) {
      org = create(:organization, status: :approved)
      user.update(organization: org)
      sign_in user
    }

    it {
      expect(get(:new)).to be_successful
    }

    it {
      expect(get(:show, params: {id: ticket.id})).to be_successful
    }

    it {
      expect(post(:capture, params: {id: ticket.id})).to redirect_to(dashboard_path + '#tickets:open')  
    }

    it {
      expect(patch(:release, params: {id: ticket.id})).to redirect_to(dashboard_path + '#tickets:captured')
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

    it {
      t = create(:ticket)
      post(:create, params: {ticket: {name: t.name, phone: t.phone, description: t.description, region_id: t.region_id, resource_category_id: t.resource_category_id}})
      expect(response).to redirect_to ticket_submitted_path
    }

  end 

  describe 'logged in user with approved organization' do
    let(:user) { create(:user) }
    let(:ticket) { create(:ticket) }
    before(:each) {
      org = create(:organization, status: :approved)
      user.update(organization: org)
      sign_in user
    }

    it {
      t = create(:ticket)
      post(:create, params: {ticket: {name: t.name, phone: t.phone, description: t.description, region_id: t.region_id, resource_category_id: t.resource_category_id}})
      expect(response).to redirect_to ticket_submitted_path
    }

    it {
      expect(get(:show, params: {id: ticket.id})).to be_successful
    }

    it {
      allow(TicketService).to receive(:capture_ticket).and_return(:ok)
      expect(post(:capture, params: {id: ticket.id})).to redirect_to(dashboard_path + '#tickets:open')
    }

    it {
      allow(TicketService).to receive(:capture_ticket).and_return(:error)
      post(:capture, params: {id: ticket.id})
      expect(response).to be_successful
    }

    it {
      allow(TicketService).to receive(:release_ticket).and_return(:ok)
      expect(patch(:release, params: {id: ticket.id})).to redirect_to(dashboard_path + '#tickets:organization')
    }

    it {
      allow(TicketService).to receive(:release_ticket).and_return(:error)
      patch(:release, params: {id: ticket.id})
      expect(response).to be_successful
    }

    it {
      allow(TicketService).to receive(:close_ticket).and_return(:ok)
      expect(get(:close, params: {id: ticket.id})).to redirect_to(dashboard_path + '#tickets:organization')
    }

    it {
      allow(TicketService).to receive(:close_ticket).and_return(:error)
      get(:close, params: {id: ticket.id})
      expect(response).to be_successful
    }
  end

end
