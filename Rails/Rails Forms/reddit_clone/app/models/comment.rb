class Comment < ApplicationRecord
  belongs_to :author,
    class_name: "User",
    foreign_key: "user_id"
  belongs_to :post

  has_many :child_comments,
    class_name: "Comment",
    foreign_key: "parent_comment_id"
end
