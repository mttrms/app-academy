class User < ApplicationRecord
  after_initialize :ensure_session_token

  has_many :subs
  has_many :posts

  validates :username, presence: true
  validates :password, length: { minimum: 6 }, allow_nil: true

  def self.generate_session_token
    SecureRandom.urlsafe_base64
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)

    user.is_password?(password) ? user : nil
  end

  def password=(password)
    @password = password
    self.password_hash = BCrypt::Password.create(password)

    self.password_hash
  end

  def is_password?(password)
    password_digest = BCrypt::Password.new(self.password_hash)

    password_digest == password
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save

    self.session_token
  end

  attr_reader :password
end
