# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  has_many :shortened_urls
  has_many :visits
  has_many :visited_urls,
    -> { distinct },
    through: :visits,
    source: :shortened_url

  validates :email, presence: true, uniqueness: true
end
