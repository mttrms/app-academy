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

require 'rails_helper'

RSpec.describe Capy, type: :model do
  # What to test?
  #   Validations
  #   Associations
  #   Class Methods
  #   Error Messages

  # subject(:capy) { Capy.new(name: 'carlo', color: 'yellow') }
  subject(:capy) { FactoryBot.build(:capy) }

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:color) }
    it { should validate_uniqueness_of(:name) }

    it 'should validate color is not green' do
      # green_capy = Capy.new(name: 'barbara', color: 'green')
      # green_capy = FactoryBot.build(:capy, color: 'green')
      green_capy = FactoryBot.build(:green_capy)
      green_capy.valid?
      expect(green_capy.errors[:color]).to eq(['cannot be green!!'])
    end
  end

  describe 'associations' do
    it { should have_many(:parties) }
    it { should have_many(:attendances) }
    it { should have_many(:parties_to_attend).through(:attendances) }
  end

  describe 'class methods' do
    describe '::capys_of_the_rainbow' do
      # it 'should return all capys of color rainbow' do
      #   rainbow = Capy.create(name: 'rainbow', color: 'rainbow')
      #   not_rainbow = Capy.create(name: 'not a rainbow', color: 'sparkly')
      #
      #   expect(Capy.capys_of_the_rainbow).to include(rainbow)
      #   expect(Capy.capys_of_the_rainbow).not_to include(not_rainbow)
      # end

      it 'should return all capys of color rainbow' do
        expect(Capy.capys_of_the_rainbow.where_values_hash).to eq({'color' => 'rainbow'})
      end
    end

  end

end




