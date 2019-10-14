require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.new(
    email: 'fake@email.com',
    password: 'Hunter12'
  ) }

  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe "#is_password?" do
    it "returns false when password is incorrect" do
      expect(user.is_password?('Warlock13')).to be false
    end

    it "returns true when password is correct" do
      expect(user.is_password?('Hunter12')).to be true
    end
  end

  describe "#reset_session_token!" do
    it "resets the session token" do
      old_token = user.session_token
      user.reset_session_token!
      expect(user.session_token).not_to eq(old_token)
    end

    it "returns the new session token" do
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end

  describe "::find_by_credentials" do
    before { user.save }

    it "returns nil when a user is not found" do
      found_user = User.find_by_credentials('fake@email.com', 'Warlock12')
      expect(found_user).to be_nil
    end

    it "returns the user when credentials match" do
      found_user = User.find_by_credentials('fake@email.com', 'Hunter12')
      expect(found_user).to eq(user)
    end
  end
end
