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
    @pairs.each do |pair|
      if pair[0] == key
        pair[1] = value 
        return
      end
    end

    @pairs << [key, value]
  end

  def get(key)
    @pairs.each do |pair|
      return pair[1] if pair[0] == key
    end

    nil
  end

  def delete(key)
    @pairs.each do |pair|
      if pair[0] == key
        @pairs.delete(pair)
        return pair
      end
    end

    nil
  end

  def show
    @pairs.each do |pair|
      print "#{pair[0]} => #{pair[1]}"
      puts
    end
  end
end
