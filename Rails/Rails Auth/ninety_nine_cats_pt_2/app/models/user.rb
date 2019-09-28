class User < ApplicationRecord
  attr_reader :password

  validates :user_name, :session_token, presence: true
  validates :password_digest, presence: { message: 'Password can\'t be blank' }
  validates :password, length: { minimum: 6, allow_nil: true }

  has_many :cats
  has_many :cat_rental_requests

  after_initialize :ensure_session_token

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    digest = BCrypt::Password.new(self.password_digest)
    digest.is_password?(password)
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end
  
  def self.find_by_credentials(user_name, password)
    user = User.find_by(user_name: user_name)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

end
