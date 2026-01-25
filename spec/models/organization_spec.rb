require 'rails_helper'

RSpec.describe Organization, type: :model do

  it 'has a agreement_one attribute' do
  organization = Organization.new
  expect(organization).to respond_to(:agreement_one)
  end

end
