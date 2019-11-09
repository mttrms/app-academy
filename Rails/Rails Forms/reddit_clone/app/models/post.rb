class Post < ApplicationRecord
  belongs_to :author,
    class_name: "User",
    foreign_key: "user_id"
  has_many :post_subs
  has_many :subs,
    through: :post_subs,
    source: :sub

  validates :title, presence: true
  validates :subs, presence: true
end
