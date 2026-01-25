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

  it 'has a agreement_six attribute' do
    expect(organization).to respond_to(:agreement_six)
  end

  it 'has a agreement_seven attribute' do
    expect(organization).to respond_to(:agreement_seven)
  end

  it 'has a agreement_eight attribute' do
    expect(organization).to respond_to(:agreement_eight)
  end

  it 'has a name attribute' do
    expect(organization).to respond_to(:name)
  end

  it 'has a status attribute' do
    expect(organization).to respond_to(:status)
  end

  it 'has a phone attribute' do
    expect(organization).to respond_to(:phone)
  end

  it 'has a email attribute' do
    expect(organization).to respond_to(:email)
  end

  it 'has a description attribute' do
    expect(organization).to respond_to(:description)
  end

  it 'has a rejection_reason attribute' do
    expect(organization).to respond_to(:rejection_reason)
  end

  it 'has a liability_insurance attribute' do
    expect(organization).to respond_to(:liability_insurance)
  end

  it 'has a primary_name attribute' do
    expect(organization).to respond_to(:primary_name)
  end

  it 'has a secondary_name attribute' do
    expect(organization).to respond_to(:secondary_name)
  end

  it 'has a secondary_phone attribute' do
    expect(organization).to respond_to(:secondary_phone)
  end

  it 'has a title attribute' do
    expect(organization).to respond_to(:title)
  end

  it 'has a transportation attribute' do
    expect(organization).to respond_to(:transportation)
  end

  it { should have_many(:users) }

  it { should have_many(:tickets) }

  it { should have_and_belong_to_many(:resource_categories) }

  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:email) }
 
end
