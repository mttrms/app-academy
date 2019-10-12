# == Schema Information
#
# Table name: attendances
#
#  id          :integer          not null, primary key
#  capy_id :integer
#  party_id    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Attendance < ActiveRecord::Base
  validates :capy_id, :party_id, presence: true
  validates :party_id, uniqueness: { scope: :capy_id,
    message: 'Capys cannot have two invites to the same party.' }
    
  belongs_to :capy
  belongs_to :party
end
