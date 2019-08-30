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

  validates :text, presence: true
end
