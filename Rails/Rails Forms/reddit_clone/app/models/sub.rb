class Sub < ApplicationRecord
  belongs_to :moderator,
    class_name: "User",
    foreign_key: "user_id"
  has_many :posts

  validates :title, :description, presence: true
end
