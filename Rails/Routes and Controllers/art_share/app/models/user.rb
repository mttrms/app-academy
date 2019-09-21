class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
end
