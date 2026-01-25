require 'rails_helper'

RSpec.describe Organization, type: :model do
  let(:organization) { Organization.new }

  it 'has a agreement_one attribute' do
    expect(organization).to respond_to(:agreement_one)
  end

  it 'has a agreement_two attribute' do
    expect(organization).to respond_to(:agreement_two)
  end

  it 'has a agreement_three attribute' do
    expect(organization).to respond_to(:agreement_three)
  end

  it 'has a agreement_four attribute' do
    expect(organization).to respond_to(:agreement_four)
  end

  it 'has a agreement_five attribute' do
    expect(organization).to respond_to(:agreement_five)
  end

  
 
end
