# Methods should be atomic
# Each method should do one thing, sometimes known as the single responsibility principle
# Methods should be short, rarely longer than 10 lines

# Refactor this one method solutions
def hanoi
  disks = (1..3).to_a.reverse
  stacks = [disks, [], []]
  until stacks[0].empty? && stacks[1..2].any?(&:empty?)
    max_height = stacks.map(&:count).max
    render_string = (max_height - 1).downto(0).map do |height|
      stacks.map do |stack|
        stack[height] || " "
      end.join("\t")
    end.join("\n")
    puts render_string
    move_hash = { "a" => 0, "b" => 1, "c" => 2 }
    while true
      print "Move From: "
      from_stack_num = move_hash[gets.chomp]
      break unless from_stack_num.nil?
      puts "Invalid move!"
    end
    while true
      print "Move To: "
      to_stack_num = move_hash[gets.chomp]
      break unless to_stack_num.nil?
      puts "Invalid move!"
    end
    from_stack, to_stack = stacks.values_at(from_stack_num, to_stack_num)
    raise "cannot move from empty stack" if from_stack.empty?
    unless (to_stack.empty? || to_stack.last > from_stack.last)
      raise "cannot move onto smaller disk"
    end
    to_stack.push(from_stack.pop)
  end
  puts "You did it!"
end

# 1. Set up a stack of disks
# 2. Set up a set of 3 stacks
# 3. Loop until it's over
# 4. Display the stacks
# 5. Get move to position
# 6. Get move from position
# 7. Move the disk while checking to see if move is valid

def disks
  (1..3).to_a.reverse
end

def stacks
  [disks, [], []]
end

def over?
  stacks[0].empty? && stacks[1..2].any?(&:empty?)
end

def display
  max_height = stacks.map(&:count).max
  render_string = (max_height - 1).downto(0).map do |height|
    stacks.map do |stack|
      stacks[height] || " "
    end.join("\t")
  end.join("\n")
end

def get_stack(prompt)
  move_hash = { "a" => 0, "b" => 1, "c" => 2 }
  while true
    print prompt
    stack_num = move_hash[gets.chomp]
    return stack_num unless stack_num.nil?
    puts "Invalid move!"
  end
end

def move_disk(from_stack, to_stack)
  from_stack, to_stack = @stacks.values_at(from_stack_num, to_stack_num)
  raise "cannot move from empty stack" if from_stack.empty?
  unless (to_stack.empty? || to_stack.last > from_stack.last)
    raise "cannot move onto smaller disk"
  end
  to_stack.push(from_stack.pop)
end

def hanoi
  until over?
    puts display
    from_stack = get_stack("Move from: ")
    to_stack = get_stack("Move to: ")
    move_disk(from_stack, to_stack)
  end
end

# Do not use global state
# Take something in, and return something.
# The only way in should be the arguments, the only way out should be the return value.