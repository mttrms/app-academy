class Goal < ApplicationRecord
  validates :title, :details, presence: true
  validates :private, :completed, inclusion: { in: [true, false] }

  belongs_to :user
end
