class Cat < ApplicationRecord
  validates :name, :skill, presence: true

  has_many :toys
end
