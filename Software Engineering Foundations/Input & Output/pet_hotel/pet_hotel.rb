require_relative "./cat.rb"
require_relative "./other_animals/dog.rb"

class PetHotel
  def initialize(name)
    @name = name
    @guests = []
  end

  def check_in(guest)
    @guests << guest
  end
end

hotel = PetHotel.new("Animal Inn")

cat_1 = Cat.new("Sennacy")
cat_2 = Cat.new("Whiskers")

dog_1 = Dog.new("Charlie")

hotel.check_in(cat_1)
hotel.check_in(cat_2)
hotel.check_in(dog_1)

p hotel
p Var