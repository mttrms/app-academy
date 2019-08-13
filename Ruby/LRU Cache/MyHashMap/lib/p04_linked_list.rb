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
    self.prev.next = self.next
    self.next.prev = self.prev
    self.next = nil
    self.prev = nil
  end
end

class LinkedList
  include Enumerable

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
    self.each do |node|
      return node.val if node.key == key
    end

    nil
  end

  def include?(key)
    self.each do |node|
      return true if node.key == key
    end

    false
  end

  def append(key, val)
    node = Node.new(key, val)

    @tail.prev.next = node
    node.prev = @tail.prev
    node.next = @tail
    @tail.prev = node

    node
  end

  def update(key, val)
    self.each do |node|
      if node.key == key
        node.val = val
        return node
      end
    end

      nil
  end

  def remove(key)
    self.each do |node|
      if node.key == key
        node.prev.next = node.next
        node.next.prev = node.prev
      end
    end
  end

  def each
    node = @head.next 
    until node == @tail
      yield(node)
      node = node.next
    end
  end

  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
