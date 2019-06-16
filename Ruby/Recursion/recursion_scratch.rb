def factorial(n)
  return 1 if n == 1
  n * factorial(n - 1)
end

def upcase(str)
  return str.upcase if str.length <= 1
  str[0].upcase + upcase(str[1..-1])
end

def iterative_upcase(str)
  str.chars.reduce("") do |upcase_str, char|
    upcase_str << char.upcase
  end
end

def reverse(str)
  return str if str.length <= 1
  str[-1] + reverse(str[0..-2])
end

# "Hello" => "olleH"
# "Hell" => "o" + "lleH"
# "ello" => "olle" + "H"

p reverse("Hello")

def quick_sort(arr)
  return arr if arr.length <= 1
  pivot_arr = [arr.first]
  left_side = arr[1..-1].select { |el| el < arr.first }
  right_side = arr[1..-1].select { |el| el >= arr.first }
  quick_sort(left_side) + pivot_arr + quick_sort(right_side)
end

p quick_sort([91,0,3,5,1,5,1,2,3,4,6,7,8,9,10,12,15,51,93,21,8,4,2,1])