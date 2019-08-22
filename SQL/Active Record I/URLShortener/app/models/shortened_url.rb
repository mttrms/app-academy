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

  validates :long_url, presence: true, uniqueness: true

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
end
