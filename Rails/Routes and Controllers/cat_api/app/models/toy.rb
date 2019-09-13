class Toy < ApplicationRecord
  TYPES = [
    "string",
    "ball",
    "yarn",
    "mouse"
  ]
  validates :cat_id, :name, :ttype, presence: true
  validates :ttype, inclusion: TYPES

  belongs_to :cat
end
