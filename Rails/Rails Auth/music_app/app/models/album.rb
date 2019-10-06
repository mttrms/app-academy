class Album < ApplicationRecord
  validates :title, :year, presence: true

  belongs_to :band
end