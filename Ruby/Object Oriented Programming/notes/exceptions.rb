# Exceptions tell a caller that your code can't do what was asked.

def sqrt(num)
  unless num >= 0
    raise ArgumentError.new "Cannot take sqrt of negative number"
  end

  # code to calculate square root...
end

# When an exception is raised, the method stops executing, and the method's caller
# gets a chance to handle the exception.

def main
  # run the main program in a loop
  while true
    # get an integer from the user
    puts "Please input a number"
    num = gets.to_i

    begin
      sqrt(num)
    rescue ArgumentError => e
      puts "Couldn't take the square root of #{num}"
      puts "Error was: #{e.message}"
    end
  end
end

# Ensure - sometimes there is important code that must be executed whether or
# not an exception is raised. We can use ensure to handle that.

begin
  a_dangerous_operation
rescue StandardError => e
  puts "Something went wrong: #{e.message}"
ensure
  puts "No matter what, make sure to execute this!"
end

f = File.open
begin
  f << a_dangerous_operation
ensure
  # must. close. file.
  f.close
end

# The retry keyword will cause Ruby to repeat the begin block from the beginning.

def prompt_name
  puts "Please input a name:"
  # split name on spaces
  name_parts = gets.chomp.split

  if name_parts.count != 2
    raise "Uh-oh, finnicky parsing!"
  end

  name_parts
end

def echo_name
  begin
    fname, lname = prompt_name

    puts "Hello #{fname} of #{lname}"
  rescue
    puts "Please only use two names."
    retry
  end
end

# Implicit Begin Blocks – Method and class definitions are implicity wrapped in
# a begin / end block, so if error handling applies to the entire method, just 
# add rescue.

def echo_name
  fname, lname = prompt_name

  puts "Hello #{fname} of #{lname}"
rescue
  puts "Please only use two names."
  retry
end

# Write your own failture types

class EngineStalledError < StandardError
end

class CollisionOccurredError < StandardError
end

def drive_car
  # engine may stall, collision may occur
end

begin
  drive_car
rescue EngineStalledError => e
  puts "Rescued from engine stalled!"
rescue CollisionOccurredError => e
  puts "Rescued from collision!"
ensure
  puts "Car stopped."
end