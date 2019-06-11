class Card
  attr_reader :face_up, :value, :reveal

  def initialize(value)
    @value = value
    @face_up = false
  end

  def reveal
    @face_up = true
  end

  def hide
    @face_up = false
  end
end