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

require 'rails_helper'

RSpec.describe Attendance, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
