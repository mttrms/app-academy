class User < ApplicationRecord
  attr_reader :password

  validates :user_name, :session_token, presence: true
  validates :password_digest, presence: { message: 'Password can\'t be blank' }
  validates :password, length: { minimum: 6, allow_nil: true }
end
