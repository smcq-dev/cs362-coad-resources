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

end
