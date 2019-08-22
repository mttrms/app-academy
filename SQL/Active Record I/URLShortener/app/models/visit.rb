# == Schema Information
#
# Table name: visits
#
#  id               :bigint           not null, primary key
#  user_id          :bigint
#  shortened_url_id :bigint
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Visit < ApplicationRecord
  belongs_to :user
  belongs_to :shortened_url

  def self.record_visit!(options)
    user = options[:user]
    url = options[:shortened_url]

    Visit.create!(
      shortened_url_id: url.id,
      user_id: user.id
    )
  end
end
