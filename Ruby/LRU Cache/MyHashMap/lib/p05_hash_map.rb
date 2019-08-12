require_relative 'p04_linked_list'

class HashMap
  include Enumerable

  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key).include?(key)
  end

  def set(key, val)
    node_bucket = bucket(key)
    if include?(key)
      node_bucket.update(key, val)
    else
      node_bucket.append(key, val)
      @count += 1
    end

    resize! if @count == num_buckets
  end

  def get(key)
    bucket(key).get(key)
  end

  def delete(key)
    node_bucket = bucket(key)
    if include?(key)
      node_bucket.remove(key)
      @count -= 1
    end
  end

  def each
    @store.each do |bucket|
      bucket.each { |node| yield(node.key, node.val) }
    end
  end

  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    previous_buckets = @store.dup
    @store = Array.new(num_buckets * 2) { LinkedList.new }
    @count = 0

    previous_buckets.each do |bucket|
      bucket.each { |node| self[node.key] = node.val }
    end
  end

  def bucket(key)
    @store[key.hash % num_buckets]
  end
end
