# Reduce / Inject

arr = [2, 3, 1, 7]

p arr.reduce { |acc, el| acc + el }
p arr.reduce(100) {|acc, el| acc + el}

result = arr.reduce do |acc, el|
  if el < acc
    el
  else
    acc
  end
end

p result

p arr.reduce { |acc, el| acc * el}