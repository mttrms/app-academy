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

  def self.artworks_for_user_id(user_id)
    Artwork
      .left_outer_joins(:artwork_shares)
      # :user_id is similar to '?' in SQL fragments but it can be set + reused
      .where('(artworks.artist_id = :user_id) OR (artwork_shares.viewer_id = :user_id)', user_id: user_id)
  end
end
