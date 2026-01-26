require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let (:ticket) { Ticket.new }

  it 'has a name attribute' do
    expect(ticket).to respond_to(:name)
  end

  it 'has a description attribute' do
    expect(ticket).to respond_to(:description)
  end

  it 'has a phone attribute' do
    expect(ticket).to respond_to(:phone)
  end

  it 'has a closed attribute' do
    expect(ticket).to respond_to(:closed)
  end

  it 'has a closed_at attribute' do
    expect(ticket).to respond_to(:closed_at)
  end

  it { should belong_to(:region) }

  it { should belong_to(:resource_category) }

  it { should belong_to(:organization).optional }

  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:phone) }

  it { should validate_presence_of(:region_id) }

  it { should validate_presence_of(:resource_category_id) }

  it { should validate_length_of(:name).is_at_least(1).is_at_most(255) }

  it { should validate_length_of(:description).is_at_most(1020) }

  it { should allow_value('+1 500-500-5000').for(:phone) }

  it { should_not allow_value('inv').for(:phone) }

  it { should_not allow_value('541').for(:phone) }

  describe 'methods' do

    describe 'open?' do

      it 'checks for openness' do
        expect(ticket.open?).to eq(true)
      end

    end

    describe 'captured?' do

      it 'check if an organization has claimed it' do 
        organization = Organization.new
        ticket = Ticket.new(organization: organization)
        expect(ticket.captured?).to eq(true)
      end
    
    end

    describe 'to_s' do

      it 'assigns and id and checks it' do 
        ticket = Ticket.new(id: 123)
        expect(ticket.to_s).to eq("Ticket 123")
      end
    
    end

  end

  describe 'scope' do

    describe '.open' do

      it 'returns only open tickets' do
        open_ticket = Ticket.new(closed: false, organization_id: nil)
        open_ticket.save(validate: false)

        closed_ticket = Ticket.new(closed: true)
        closed_ticket.save(validate: false)

        result = Ticket.open

        expect(result).to include(open_ticket)
        expect(result).not_to include(closed_ticket)

      end
  
    end

    describe '.closed' do
      
      it 'returns only closed tickets' do
        open_ticket = Ticket.new(closed: false, organization_id: nil)
        open_ticket.save(validate: false)

        closed_ticket = Ticket.new(closed: true)
        closed_ticket.save(validate: false)

        result = Ticket.closed

        expect(result).to include(closed_ticket)
        expect(result).not_to include(open_ticket)

      end

    end

    describe '.all_organizations' do

      it 'returns unclosed tickets with an organization' do
        open_ticket = Ticket.new(closed: false, organization_id: 1)
        open_ticket.save(validate: false)

        closed_ticket = Ticket.new(closed: true, organization_id: 1)
        closed_ticket.save(validate: false)

        no_org_ticket = Ticket.new(closed: false, organization_id: nil)
        no_org_ticket.save(validate: false)

        result = Ticket.all_organization

        expect(result).to include(open_ticket)
        expect(result).not_to include(closed_ticket)
        expect(result).not_to include(no_org_ticket)

      end

    end

    describe 'organization' do

      it 'returns unclosed tickets for an organization' do
        open_ticket = Ticket.new(closed: false, organization_id: 1)
        open_ticket.save(validate: false)

        closed_ticket = Ticket.new(closed: true, organization_id: 1)
        closed_ticket.save(validate: false)

        org2_ticket = Ticket.new(closed: false, organization_id: 2)
        org2_ticket.save(validate: false)

        result = Ticket.organization(1)

        expect(result).to include(open_ticket)
        expect(result).not_to include(closed_ticket)
        expect(result).not_to include(org2_ticket)
        
      end

    end

  end

end
