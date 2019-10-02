class User < ApplicationRecord
  after_initialize :ensure_session_token

  def self.generate_session_token
    SecureRandom.urlsafe_base64(20)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end
end
