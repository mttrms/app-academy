class Player
  attr_reader :name, :hand, :money, :folded

  def initialize
    @hand = Hand.new
    @money = 500
    @folded = false
  end
end

