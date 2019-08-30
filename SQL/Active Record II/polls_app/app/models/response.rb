# == Schema Information
#
# Table name: responses
#
#  id               :bigint           not null, primary key
#  user_id          :bigint
#  answer_choice_id :bigint
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Response < ApplicationRecord
  belongs_to :answer_choice
  belongs_to :respondent,
  class_name: 'User',
  foreign_key: :user_id
  
  validates :answer_choice, presence: true
  validates :respondent, presence: true
end
