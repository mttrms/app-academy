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
    urls.joins(:visits)
      .group(:short_url, :long_url)
      .order('COUNT(visits.user_id) DESC')
      .select('long_url, short_url, COUNT(visits.user_id) as number_of_visits')
      .limit(5)
  end
end
