class Array
  def deep_dup
    duped = []
    
    self.each do |ele|
      ele.is_a?(Array) ? duped << ele.deep_dup : duped << ele
    end

    duped
  end  
end

arr = [1, [2], [3, [4]]]
duped = arr.deep_dup

arr[1] << "test"
p arr
p duped

robot_parts = [
  ["nuts", "bolts", "washers"],
  ["capacitors", "resistors", "inductors"]
]

robot_parts_copy = robot_parts.deep_dup
robot_parts_copy[1] << "LEDs"
p robot_parts_copy
p robot_parts
