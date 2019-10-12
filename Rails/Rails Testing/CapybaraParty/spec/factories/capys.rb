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

FactoryBot.define do
  factory :capy do
    name { Faker::Name.name }
    color { Faker::Color.hex_color }

    factory :green_capy do 
      color 'green'
    end
  end
end
