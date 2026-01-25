require 'rails_helper'

RSpec.describe User, type: :model do
let (:user) { User.new }

  it 'has a email attribute' do
    expect(user).to respond_to(:email)
  end

  it 'has a role attribute' do
    expect(user).to respond_to(:role)
  end

  it { should belong_to(:organization).optional }

  it { should validate_presence_of(:email) }

end
