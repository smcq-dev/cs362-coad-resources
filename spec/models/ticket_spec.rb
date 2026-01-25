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

end
