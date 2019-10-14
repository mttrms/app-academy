class User < ApplicationRecord
  attr_reader :password

  validates :email, :session_token, :password_digest, presence: true
  validates :email, :session_token, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    password_digest = BCrypt::Password.new(self.password_digest)
    password_digest == password
  end
end
