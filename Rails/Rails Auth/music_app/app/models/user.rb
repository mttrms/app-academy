class User < ApplicationRecord
  after_initialize :ensure_session_token

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    password_digest = BCrypt::Password.new(self.password_digest)
    password_digest.is_password?(password)
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    user.is_password?(password) ? user : nil
  end

  def self.find_by_session_token(session_token)
    User.find_by(session_token: session_token)
  end

  def self.generate_session_token
    SecureRandom.urlsafe_base64(20)
  end
end
