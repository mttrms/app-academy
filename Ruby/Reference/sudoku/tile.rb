require "colorize"

class Tile
  attr_reader :value, :given

  def initialize(value, given = false)
    @value = value
    @given = given
  end
  
  def to_s
    self.given == true ? color = :white : color = :light_magenta
    "#{self.value}".colorize(color)
  end
end

b = Tile.new(2, false)
puts b.to_s

