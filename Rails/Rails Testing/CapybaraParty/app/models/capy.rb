# == Schema Information
#
# Table name: capys
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  color      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Capy < ActiveRecord::Base
  validates :name, :color, presence: true
  validates :name, uniqueness: true
  validate :color_not_green

  has_many :parties, inverse_of: :capy
  has_many :attendances
  has_many :parties_to_attend, through: :attendances, source: :party

  def self.capys_of_the_rainbow
    Capy.where(color: 'rainbow')
  end

  def color_not_green
    errors[:color] << "cannot be green!!" if color == 'green'
  end
end
