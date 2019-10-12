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

require 'rails_helper'

RSpec.describe Party, type: :model do
  let(:party) { FactoryBot.build(:party) }

  it { should belong_to(:capy) }
end
