def my_uniq(arr)
  uniq = []
  arr.each { |el| uniq << el unless uniq.include?(el) }
  return uniq
end

class Array
  def two_sum
    pairs = []

    self.each_with_index do |num, idx|
      self.each_with_index do |num2, idx2|
        next if idx == idx2

        if num + num2 == 0 && pairs.none? { |el| el.include?(idx) }
          pairs << [idx, idx2]
        end
      end
    end

    pairs
  end

  def my_transpose
    transposed = []

    i = 0
    while i < self.length
      transposed << []
      self.each { |el| transposed[i] << el[i] }
      i += 1
    end

    transposed
  end
end
