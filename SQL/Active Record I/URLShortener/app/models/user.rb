class User < ApplicationRecord
  has_many :shortened_urls

  validates :email, presence: true, uniqueness: true
end
