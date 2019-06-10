class Card
  attr_reader :face_up, :value

  def initialize(value)
    @value = value
    @face_up = false
  end
end