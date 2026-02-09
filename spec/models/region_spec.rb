require 'rails_helper'

RSpec.describe Region, type: :model do
  let(:region) { Region.new }

  it 'has a name attribute' do
    expect(region).to respond_to(:name)
  end

  it { should have_many(:tickets) }

  it { should validate_presence_of(:name) }

  it { should validate_length_of(:name).is_at_least(1).is_at_most(255) }

  it { should validate_uniqueness_of(:name).case_insensitive }

  describe 'methods' do

    describe 'unspecified' do

      it 'creates a unspecified region' do
        region = build(:region, name: 'unspecified')
        expect(region.name).to eq('unspecified')
      end

    end

    describe 'to_s' do

      it 'prints name' do
        region = build(:region, name:'somewhere')
        expect(region.name).to eq('somewhere')
      end

    end

  end

end
