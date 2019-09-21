class User < ApplicationRecord
  has_many :artworks, foreign_key: 'artist_id'

  validates :username, presence: true, uniqueness: true
end
