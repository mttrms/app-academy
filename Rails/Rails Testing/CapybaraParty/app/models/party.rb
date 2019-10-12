# == Schema Information
#
# Table name: parties
#
#  id          :integer          not null, primary key
#  capy_id :integer          not null
#  occasion    :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Party < ActiveRecord::Base
  validates :capy, presence: true
  belongs_to :capy, inverse_of: :parties

  has_many :attendances
  has_many :guests, through: :attendances, source: :capy
end
