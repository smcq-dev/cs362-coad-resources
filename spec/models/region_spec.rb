require 'rails_helper'

RSpec.describe Region, type: :model do
  let(:region) { Region.new }

  it 'has a name attribute' do
    expect(region).to respond_to(:name)
  end

  it "has a string representation that is its name" do
    name = 'Mt. Hood'
    region = Region.new(name: name)
    result = region.to_s
  end

  it { should have_many(:tickets) }

  it { should validate_presence_of(:name) }

  it { should validate_length_of(:name).is_at_least(1).is_at_most(255) }

  it { should validate_uniqueness_of(:name).case_insensitive }

  describe 'methods' do

    describe 'unspecified' do

      it 'creates a unspecified region' do
        region = Region.unspecified
        expect(region.name).to eq('Unspecified')
      end

    end

  end

end
