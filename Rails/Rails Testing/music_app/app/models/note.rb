class Note < ApplicationRecord
  validates :body, presence: true

  belongs_to :user
  belongs_to :track
end
