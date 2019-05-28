# Monkey Patching
# Adding additional methods to an existing class

# Ruby types are classes: Integer, String, Array, Hash, etc..

# Hash.new # calling the initialize method

class String
  def upcase?
    self == self.upcase
  end
end

p 'hello'.upcase? # false
p 'HELLO'.upcase? # true

puts 'Integers'

class Integer
  def prime?
    return false if self < 2

    (2...self).each do |factor|
      return false if (self % factor).zero?
    end

    true
  end
end

p 7.prime? #true
p 11.prime? #true
p 12.prime? #false

puts 'Arrays'

class Array
  def has_zero?
    self.include?(0)
  end
end

p [1,2,4,0,'hi'].has_zero? # true
p [1,2,4,4,'hello'].has_zero? # false
