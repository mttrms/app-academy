# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.empty?

    self.max - self.min
  end

  def average
    return nil if self.empty?

    self.sum * 1.0 / self.length
  end
  
  def median
    return nil if self.empty?

    if self.length.even?
      halfway = self.length / 2
      (self.sort[halfway - 1] + self.sort[halfway]) / 2.0      
    else 
      self.sort[self.length / 2]
    end
  end

  def counts
    count = Hash.new(0)
    self.each { |ele| count[ele] += 1 }
    count
  end

end
