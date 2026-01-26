require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
  let(:resource) { ResourceCategory.new }

  it 'has a name attribute' do
    expect(resource).to respond_to(:name)
  end

  it 'has a active attribute' do
    expect(resource).to respond_to(:active)
  end

  it { should have_many(:tickets) }

  it { should have_and_belong_to_many(:organizations) }

  it { should validate_presence_of(:name) }
  
  it { should validate_length_of(:name).is_at_least(1).is_at_most(255) }

  it { should validate_uniqueness_of(:name).case_insensitive }

  describe 'methods' do 

    describe 'unspecified' do

      it 'creates resource named unspecified' do
        resource = ResourceCategory.unspecified
        expect(resource.name).to eq('Unspecified')
      end

    end

    describe 'activate' do

      it 'sets active to true' do 
        resource.activate
        expect(resource.active).to eq(true)
      end
    
    end

    describe 'deactivate' do

      it 'sets active to false' do 
        resource.deactivate
        expect(resource.active).to eq(false)
      end
    
    end

    describe 'inactive?' do

      it 'tests for activeness' do 
        resource.deactivate
        expect(resource.inactive?).to eq(true)
      end
    
    end

    describe 'to_s' do

      it 'prints resource name' do
        resource = ResourceCategory.new(name: 'test resource')
        expect(resource.name).to eq('test resource')
      end
    
    end

  end

end
