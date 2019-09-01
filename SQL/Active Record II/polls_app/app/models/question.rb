# == Schema Information
#
# Table name: questions
#
#  id      :bigint           not null, primary key
#  text    :string
#  poll_id :bigint
#

class Question < ApplicationRecord
  belongs_to :poll
  has_many :answer_choices
  has_many :responses,
    through: :answer_choices,
    source: :responses

  validates :text, presence: true

  def results
    results = {}

    response_data = answer_choices
      .select(:id, :'answer_choices.text', 'COUNT(answer_choice_id) AS response_count')
      .joins('LEFT JOIN responses ON answer_choices.id = responses.answer_choice_id')
      .where(question_id: self.id)
      .group('answer_choices.id')
    
    response_data.each do |answer|
      results[answer.text] = answer.response_count
    end

    results
  end
end
