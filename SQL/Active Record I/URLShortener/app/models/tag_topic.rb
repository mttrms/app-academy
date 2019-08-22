# == Schema Information
#
# Table name: tag_topics
#
#  id   :bigint           not null, primary key
#  name :string
#

class TagTopic < ApplicationRecord
  has_many :taggings

  has_many :urls,
    through: :taggings,
    source: :shortened_url

  validates :name, presence: true, uniqueness: true

  def popular_links
    # ShortenedUrl.select(:id, :long_url).joins(:taggings, :visits).limit(5)
    # long_url, click count, limit, sorted by click count desc
    # ShortenedUrl.select('count(visits.user_id)').joins(:visits)
  end
end
