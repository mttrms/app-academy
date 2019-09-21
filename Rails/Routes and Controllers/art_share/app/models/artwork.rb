class Artwork < ApplicationRecord
  belongs_to :artist,
    class_name: 'User',
    foreign_key: :artist_id

  has_many :artwork_shares

  has_many :shared_viewers,
    through: :artwork_shares,
    source: :viewer

  validates :title, :image_url, :artist_id,  presence: true
  validates :title, uniqueness: { scope: :artist }
end
