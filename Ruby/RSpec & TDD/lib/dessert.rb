class Dessert
  attr_reader :type, :amount

  def initialize(type, amount)
    raise 'Amount must be a number' unless amount.is_a?(Integer)

    @amount = amount
    @type = amount > 100 ? "giant #{type}" : type
  end

  def eat(drink)
    drink.dip(self)
  end
end
