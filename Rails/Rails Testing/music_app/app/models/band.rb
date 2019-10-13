class Band < ApplicationRecord
  validates :name, presence: true

  has_many :albums
  has_many :tracks, through: :albums
end
