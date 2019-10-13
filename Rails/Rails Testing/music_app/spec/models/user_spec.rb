require 'rails_helper'

RSpec.describe User, type: :model do
  let(:invalid_user) { User.new(password: 'Hunter12') }
  let(:valid_user) { User.new(email: 'hunter12@hunter.com', password: 'Hunter12') }
  let(:no_password) { User.new(email: 'hunter12@hunter12.com') }

  # it 'validates presence of email' do
    # expect(invalid_user).not_to be_valid
    # expect(valid_user).to be_valid
  # end

  it { should validate_presence_of(:email) }

  it 'validates presence of password' do
    expect(no_password).not_to be_valid
  end
end
