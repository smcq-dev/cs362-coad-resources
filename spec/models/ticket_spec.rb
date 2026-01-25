require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let (:ticket) { Ticket.new }

   it 'has a name attribute' do
    expect(ticket).to respond_to(:name)
  end

   it 'has a description attribute' do
    expect(ticket).to respond_to(:description)
  end


end
