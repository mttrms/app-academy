class User < ApplicationRecord
  has_many :artworks, foreign_key: 'artist_id'

  has_many :artwork_shares,
    foreign_key: :viewer_id

  has_many :shared_artworks,
    through: :artwork_shares,
    source: :artwork

  validates :username, presence: true, uniqueness: true
end
