class Artwork < ApplicationRecord
  belongs_to :artist,
    class_name: 'User',
    foreign_key: :artist_id

  validates :title, :image_url, :artist_id,  presence: true
  validates :title, uniqueness: { scope: :artist }
end
