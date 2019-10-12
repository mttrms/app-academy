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

FactoryBot.define do
  factory :party do
    occasion 'birthday'

    sequence :capy do |n|
      FactoryBot.build(:capy)
    end
  end

end
