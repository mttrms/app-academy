class Step < ApplicationRecord
  belongs_to :todo

  validates :title, :body, presence: true
  validates :done, inclusion: { in: [true, false] }
end
