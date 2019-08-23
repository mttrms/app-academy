# == Schema Information
#
# Table name: shortened_urls
#
#  id        :bigint           not null, primary key
#  long_url  :string
#  short_url :string
#  user_id   :bigint
#

class ShortenedUrl < ApplicationRecord
  belongs_to :submitter,
    class_name: 'User',
    foreign_key: :user_id

  has_many :visits

  has_many :visitors,
    -> { distinct },
    through: :visits,
    source: :user

  has_many :taggings

  has_many :tag_topics,
    through: :taggings,
    source: :tag_topic

  validates :long_url, presence: true, uniqueness: true
  validate :no_spamming
  validate :nonpremium_max

  def num_clicks
    Visit.where(shortened_url_id: self.id).count(:user_id)
  end

  def num_uniques
    self.visitors.count
  end

  def num_recent_uniques
    Visit.distinct.where(
      shortened_url_id: self.id,
      created_at: 10.minutes.ago..Time.now
    ).count(:user_id)
  end

  def no_spamming
    submitted_urls = submitter.shortened_urls.where(
      created_at: 1.minute.ago..Time.now
    ).count

    if submitted_urls >= 5
      errors[:base] << "You can't submit more than 5 URLs per minute"
    end
  end

  def nonpremium_max
    return if User.find(self.user_id).premium

    if submitter.shortened_urls.count >= 5
      errors[:user] << "is not premium and has a 5 URL limit"
    end
  end

  def self.random_code
    code = nil
    while code == nil || ShortenedUrl.exists?(:short_url => code)
      code = SecureRandom::urlsafe_base64
    end

    code
  end

  def self.create_shortened_url!(options)
    user = options[:user]
    long_url = options[:long_url]

    ShortenedUrl.create!(
      long_url: long_url,
      short_url: ShortenedUrl.random_code,
      user_id: user.id
    )
  end

  def self.prune(minutes)
  end
end
