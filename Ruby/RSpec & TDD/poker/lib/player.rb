class Player
  attr_reader :name, :hand, :money

  def initialize(name)
    @name = name
    @hand = Hand.new
    @money = 500
  end
end

