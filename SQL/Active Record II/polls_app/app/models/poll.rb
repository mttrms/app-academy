# == Schema Information
#
# Table name: polls
#
#  id         :bigint           not null, primary key
#  title      :string
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Poll < ApplicationRecord
  belongs_to :author,
    class_name: 'User',
    foreign_key: :user_id
  has_many :questions

  validates :title, presence: true
end
