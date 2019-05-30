# Requiring Files
# Separate code into many files to keep things organized and easy to maintain.

# pet_hotel.rb

class PetHotel
  def initialize(name)
    @name = name
    @guests = []
  end

  def check_in(guest)
    @guests << guest
  end
end

class Cat
  def initialize(name)
    @name = name
  end
end

hotel = PetHotel.new("Animal Inn")

cat_1 = Cat.new("Sennacy")
cat_2 = Cat.new("Whiskers")

hotel.check_in(cat_1)
hotel.check_in(cat_2)

p hotel

# Separation of Concerns. One file should focus on implementing one class.
# Let's decouple Cat from PetHotel to increase reusability of our classes.
# /project_root/
#   pet_hotel.rb
#   cat.rb
#   other_animals
#     dog.rb

# project_root/cat.rb
class Cat
  def initialize(name)
    @name = name
  end
end

# project_root/other_animals/dog.rb
class Dog
  def initialize(name)
    @name = name
  end
end

# project_root/pet_hotel.rb

# Let's require the last two files, by specifying their path's relative to this pet_hotel.rb file
require_relative "./cat.rb"
require_relative "./other_animals/dog.rb"
# ...
# ...

# require_relative is a method to specificy a path to another ruby file.