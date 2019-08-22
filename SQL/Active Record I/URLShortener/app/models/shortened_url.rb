class ShortenedUrl < ApplicationRecord
  belongs_to :submitter,
    class_name: 'User',
    foreign_key: :user_id

  validates :long_url, presence: true, uniqueness: true

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
