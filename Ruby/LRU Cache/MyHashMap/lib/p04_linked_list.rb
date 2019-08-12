class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    current_node = last
    until current_node == @head
      return current_node.val if current_node.key == key
      current_node = current_node.prev
    end

    nil
  end

  def include?(key)
  end

  def append(key, val)
    node = Node.new(key, val)
    last.next = node
    node.prev = last
    node.next = @tail
    @tail.prev = node
  end

  def update(key, val)
    current_node = last

    until current_node.key == key
      return nil if current_node == @head
      current_node = current_node.prev
    end

    current_node.val = val
  end

  def remove(key)
    current_node = last

    until current_node.key == key
      return nil if current_node == @head
      current_node = current_node.prev
    end

    current_node.prev.next = current_node.next
    current_node.next.prev = current_node.prev
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
