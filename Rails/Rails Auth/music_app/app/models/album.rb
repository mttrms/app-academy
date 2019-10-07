class Album < ApplicationRecord
  validates :title, :year, presence: true

  belongs_to :band
  has_many :tracks
end