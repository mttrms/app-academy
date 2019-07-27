def my_uniq(arr)
  uniq = []
  arr.each { |el| uniq << el unless uniq.include?(el) }
  return uniq
end
