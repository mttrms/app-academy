class Post < ApplicationRecord

  validates :title, :body, :author_id, :presence => true

  belongs_to :author, :class_name => "User"
  has_many :comments, :foreign_key => :post_id

  def self.by_popularity
    self
    .select('posts.*, COUNT(*) AS comment_count')
    .joins(:comments)
    .group('posts.id')
    .order('comment_count DESC')
  end
end
