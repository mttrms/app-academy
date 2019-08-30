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
  has_one :question,
    through: :answer_choice,
    source: :question
  
  validate :respondent_already_answered?, unless: -> { answer_choice.nil? }
  validate :respondent_is_author?, unless: -> { question.nil? }
  
  def sibling_responses
    self.question.responses.where.not(id: self.id)
  end

  def respondent_already_answered?
    if sibling_responses.any? { |response| response.user_id == self.user_id }
      errors[:respondent] << "has already answered"
    end
  end

  def respondent_is_author?
    if question.poll.author == respondent
      errors[:respondent] << "cannot respond to own poll"
    end
  end
end
