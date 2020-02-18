# == Schema Information
#
# Table name: benches
#
#  id          :bigint           not null, primary key
#  description :string           not null
#  lat         :float            not null
#  lng         :float            not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Bench < ApplicationRecord
  validates :description, :lat, :lng, :seating, presence: true

  def self.in_bounds(bounds)
    self.where('lat < ?', bounds[:northEast][:lat])
        .where('lat > ?', bounds[:southWest][:lat])
        .where('lng < ?', bounds[:northEast][:lng])
        .where('lng > ?', bounds[:southWest][:lng])
  end
end
