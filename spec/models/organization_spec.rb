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

  it { should validate_presence_of(:phone) }

  it { should validate_presence_of(:status) }

  it { should validate_presence_of(:primary_name) }

  it { should validate_presence_of(:secondary_name) }

  it { should validate_presence_of(:secondary_phone) }

  it { should validate_length_of(:email).is_at_least(1).is_at_most(255) }

  it { should allow_value('test@email.com').for(:email) }

  it { should_not allow_value('test-email').for(:email) }

  it { should validate_uniqueness_of(:email).case_insensitive }

  it { should validate_length_of(:name).is_at_least(1).is_at_most(255) }

  it { should validate_uniqueness_of(:name).case_insensitive }

  it { should validate_length_of(:description).is_at_most(1020) }

  describe 'methods' do

    describe 'approve' do

      it 'sets status to approved ' do
        organization.approve
        expect(organization.status).to eq("approved")
      end

    end

    describe 'reject' do

      it 'sets status to rejected' do
        organization.reject
        expect(organization.status).to eq("rejected")
      end

    end

    describe 'set_default_status' do

      it 'sets status to submitted' do
        organization.set_default_status
        expect(organization.status).to eq("submitted")
      end

    end
  
  end
 
end
