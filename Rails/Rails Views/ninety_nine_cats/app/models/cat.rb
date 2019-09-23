class Cat < ApplicationRecord
  validates :name, :birth_date, :sex, :color, :description, presence: true
  validates :color, inclusion: { in: %w(white black red gray cream brown cinnamon)}
  validates :sex, inclusion: { in: %w(m f)}

  def age
  end
end