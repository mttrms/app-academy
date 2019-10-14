require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.new(
    email: 'test@test.com',
    password: 'Hunter12'
  ) }

  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) } 
  end

  describe "#is_password?" do
    it "returns true with correct password" do
      expect(user.is_password?('Hunter12')).to be true
    end

    it "returns false with incorrect password" do
      expect(user.is_password?('Warlock13')).to be false
    end
  end

  describe "#reset_session_token" do
    it "resets the session token" do
      session_token = user.session_token
      user.reset_session_token!

      expect(session_token).not_to eq(user.session_token)
    end

    it "returns the new session token" do
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end

  describe "::find_by_credentials" do
    before { user.save! }

    it "returns the user if credentials match" do
      expect(User.find_by_credentials('test@test.com', 'Hunter12')).to eq(user)
    end

    it "returns nil when given bad credentials" do
      expect(User.find_by_credentials('test@test.com', 'Warlock13')).to be_nil
    end
  end
end
