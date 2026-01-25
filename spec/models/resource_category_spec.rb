require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
  let(:resource) { ResourceCategory.new }

  it 'has a name attribute' do
    expect(resource).to respond_to(:name)
  end
end
