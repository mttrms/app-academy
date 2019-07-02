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
class Queue
  def initialize
    @queue = []
  end

  def enqueue(element)
    @queue << element
  end

  def dequeue
    @queue.shift
  end

  def peek
    @queue[0]
  end
end

# Create a Map Class
class Map
  def initialize
    @pairs = []
  end

  def set(key, value)
  end

  def get(key)
  end

  def delete(key)
  end

  def show
  end
end
