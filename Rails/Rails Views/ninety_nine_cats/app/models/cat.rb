class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper

  COLORS = %w(white black red gray cream brown cinnamon)

  has_many :cat_rental_requests, dependent: :destroy
  validates :name, :birth_date, :sex, :color, :description, presence: true
  validates :color, inclusion: { in: COLORS}
  validates :sex, inclusion: { in: %w(m f)}

  def age
    time_ago_in_words(birth_date)
  end
end