class MaxIntSet
  attr_reader :store

  def initialize(max)
    @store = Array.new(max, false)
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
    num >= 0 && num <= @store.length
  end
end


class IntSet
  attr_reader :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num unless include?(num)
    num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :store, :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless include?(num)
      self[num] << num
      @count += 1

      num
    end

    resize! if @count == num_buckets
  end

  def remove(num)
    if include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    prev_buckets = store.dup
    @store = Array.new(num_buckets * 2) { Array.new }
    @count = 0

    prev_buckets.flatten.each { |num| insert(num) }
  end
end
