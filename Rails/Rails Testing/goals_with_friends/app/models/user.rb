class User < ApplicationRecord
  after_initialize :ensure_session_token

  attr_reader :password

  validates :email, :session_token, :password_digest, presence: true
  validates :email, :session_token, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  has_many :goals

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    password_digest = BCrypt::Password.new(self.password_digest)

    password_digest == password
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def self.generate_session_token
    SecureRandom.urlsafe_base64
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save

    self.session_token
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return nil if user.nil?

    user.is_password?(password) ? user : nil
  end
end
