class MaxIntSet
  attr_reader :store

  def initialize(max)
    @store = Array.new(max + 1)
  end

  def insert(num)
    raise ArgumentError, "Out of bounds" unless is_valid?(num)

    @store[num] = true
  end

  def remove(num)
    raise ArgumentError, "Out of bounds" unless is_valid?(num)

    @store[num] = false
  end

  def include?(num)
    raise ArgumentError, "Out of bounds" unless is_valid?(num)

    @store[num]
  end

  private

  def is_valid?(num)
    num >= 0 && num < @store.length
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
