class Card
  attr_reader :face_up, :value

  def initialize(value)
    @value = value
    @face_up = false
  end

  def reveal
    @face_up = !@face_up
  end
end