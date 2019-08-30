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

    answer_choices.includes(:responses).each do |answer|
      results[answer.text] = answer.responses.length
    end

    results
  end
end
