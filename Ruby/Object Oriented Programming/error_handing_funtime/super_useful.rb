# PHASE 2
def convert_to_int(str)
  begin
    num = Integer(str)
  rescue StandardError
    puts "Can't convert to an Integer. Must be a valid numeric string"
  end

  num || nil
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise CoffeeError
  else 
    raise ArgumentError 
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  puts "Feed me a fruit! (Enter the name of a fruit:)"
  
  begin
    maybe_fruit = gets.chomp
    reaction(maybe_fruit) 
  rescue ArgumentError => e
    puts "#{maybe_fruit} isn't a fruit."
  rescue CoffeeError
    puts "Not a fruit, but I like coffee. Try again: "
    retry
  end
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise ArgumentError.new("'name' cannot be blank") if name.empty?
    raise ArgumentError.new("'yrs_known' must be greater than or equal to 5 (best friendships take time)") if yrs_known.to_i < 5
    raise ArgumentError.new("'fav_pasttime' cannot be blank") if fav_pastime.empty?

    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end

class CoffeeError < StandardError
end
