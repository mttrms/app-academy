class Post < ApplicationRecord
  belongs_to :author,
    class_name: "User",
    foreign_key: "user_id"
  has_many :post_subs
  has_many :subs,
    through: :post_subs,
    source: :sub
  has_many :comments

  validates :title, presence: true
  validates :subs, presence: true

  def comments_by_parent_id
    comments = {}

    self.comments.each do |comment|
      comments[comment.parent_comment_id] ||= Array.new
      comments[comment.parent_comment_id] << comment
    end

    comments
  end
end
