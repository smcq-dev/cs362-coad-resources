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

  it { should validate_length_of(:email).is_at_least(1).is_at_most(255) }

  it { should allow_value('test@email.com').for(:email) }

  it { should_not allow_value('test-email').for(:email) }

  it { should validate_uniqueness_of(:email).case_insensitive }

  it { should validate_presence_of(:password) }

  it { should validate_length_of(:password).is_at_least(7).is_at_most(255) }

  describe 'methods' do

    describe 'set_default_role' do

      it 'sets user to default role' do
        user = User.new
        expect(user.role).to eq('organization')
      end

    end

    describe 'to_s' do

      it 'prints the email' do
        user = User.new(email: 'test@gmail.com')
        expect(user.to_s).to eq('test@gmail.com')
      end

    end

  end

end
