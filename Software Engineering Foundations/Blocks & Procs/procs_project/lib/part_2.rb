def reverser(str, &prc)
  prc.call(str.reverse)
end

def word_changer(str, &prc)
  changed = str.split(" ").map do |word|
    prc.call(word)
  end.join(" ")
end

def greater_proc_value(num, prc1, prc2)
  result1 = prc1.call(num)
  result2 = prc2.call(num)
  result1 > result2 ? result1 : result2
end

def and_selector(arr, prc1, prc2)
  arr.select { |ele| prc1.call(ele) && prc2.call(ele) }
end

def alternating_mapper(arr, prc1, prc2)
  arr.each_with_index.map { |ele, idx| idx % 2 == 0 ? prc1.call(ele) : prc2.call(ele) }
end
