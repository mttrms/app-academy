# == Schema Information
#
# Table name: answer_choices
#
#  id          :bigint           not null, primary key
#  text        :string
#  question_id :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class AnswerChoice < ApplicationRecord
  belongs_to :question
  has_many :responses

  validates :text, presence: true
end
