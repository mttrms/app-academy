class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    self.each_with_index.reduce(0) do |hash, (ele, idx)|
      (ele.hash + idx.hash) ^ hash
    end
  end
end

class String
  def hash
    self.split("").map do |char|
      char.ord
    end.hash
  end
end

class Hash
  def hash
    arr = Array.new
    self.each { |k, v| arr << [k, v] }
    arr.sort.hash
  end
end
