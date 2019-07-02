# Create a Stack Class
class Stack
  def initialize
    @elements = []
  end

  def push(element)
    @elements << element
  end

  def pop
    @elements.pop
  end

  def peek
    @elements.last
  end
end

# Create a Queue Class

# Create a Map Class