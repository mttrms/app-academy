class Sub < ApplicationRecord
  belongs_to :moderator,
    class_name: "User",
    foreign_key: "user_id"
  has_many :post_subs
  has_many :posts,
    through: :post_subs,
    source: :post

  validates :title, :description, presence: true
end
