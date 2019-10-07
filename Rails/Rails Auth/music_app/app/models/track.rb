class Track < ApplicationRecord
  validates :title, :ord, presence: true

  belongs_to :album
end