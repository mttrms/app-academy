require "colorize"

class Tile
  attr_reader :value, :given, :to_s

  def initialize(value, given = false)
    @value = value
    @given = given
  end
  
  def to_s
    self.value == 0 ? color = :white : color = :light_magenta
    "#{self.value}".colorize(color)
  end
end
