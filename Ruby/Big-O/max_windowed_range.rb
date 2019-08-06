# Given an array, and a window size w, find the maximum range (max - min) within a set of w elements.

def max_windowed_range(arr, window_size)
  current_max_range = nil

  (0..arr.length - window_size).each do |idx|
    window = arr[idx...idx + window_size]
    min = window.min
    max = window.max
    
    if current_max_range.nil? || (max - min) > current_max_range
      current_max_range = (max - min) 
    end
  end
  
  current_max_range
end

p max_windowed_range([1, 0, 2, 5, 4, 8], 2)
p max_windowed_range([1, 0, 2, 5, 4, 8], 3)
p max_windowed_range([1, 0, 2, 5, 4, 8], 4)
p max_windowed_range([1, 3, 2, 5, 4, 8], 5)

class MyQueue
  def initialize
    @store = []
  end

  def peek
    @store.first
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

  def enqueue(element)
    @store << element
  end

  def dequeue
    @store.shift
  end
end

class MyStack
  def initialize
    @store = []
  end

  def peek
    @store.last
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

  def pop
    @store.pop
  end

  def push(element)
    @store << element
  end
end

class StackQueue
  def initialize
    @queue_stack = MyStack.new
    @dequeue_stack = MyStack.new
    @active_stack = @queue_stack
  end

  def size
    @active_stack.size
  end

  def empty?
    @active_stack.empty?
  end

  def enqueue(element)
    @active_stack = @queue_stack
    until @dequeue_stack.empty?
      @queue_stack.push(@dequeue_stack.pop)
    end

    @queue_stack.push(element)
  end

  def dequeue
    @active_stack = @dequeue_stack
    until @queue_stack.empty?
      @dequeue_stack.push(@queue_stack.pop)
    end

    @dequeue_stack.pop
  end
end

class MinMaxStack
  def initialize
    @store = []
  end

  def peek
    @store.last[:value]
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

  def max
    @store.last[:max]
  end

  def min
    @store.last[:min]
  end

  def set_max(num)
    empty? ? num : [num, max].max
  end

  def set_min(num)
    empty? ? num : [num, min].min
  end

  def pop
    @store.pop
  end

  def push(num)
    @store.push({
      value: num,
      min: set_min(num),
      max: set_max(num),
    })
  end
end

class MinMaxStackQueue
  def initialize
    @queue_stack = MinMaxStack.new
    @dequeue_stack = MinMaxStack.new
  end

  def size
    @queue_stack.size
  end

  def empty?
    @queue_stack.empty?
  end

  def enqueue(num)
    @queue_stack.push(num)
  end

  def dequeue
    @dequeue_stack.push(@queue_stack.pop[:value]) until @queue_stack.empty?
    dequeued_element = @dequeue_stack.pop
    @queue_stack.push(@dequeue_stack.pop[:value]) until @dequeue_stack.empty?

    dequeued_element
  end

  def max
    @queue_stack.max
  end

  def min
    @queue_stack.min
  end
end
