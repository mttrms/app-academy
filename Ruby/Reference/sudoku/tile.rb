require "colorize"

class Tile
  attr_reader :given, :to_s
  attr_accessor :value

  def initialize(value, given = false)
    @value = value
    @given = given
  end
  
  def to_s
    self.given == true ? color = :default : color = :light_red
    "#{self.value}".colorize(color)
  end
end
