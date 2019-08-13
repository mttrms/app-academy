require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map.include?(key)
      node = @map.get(key)
      update_node!(node)

      node.val
    else
      value = @prc.call(key)
      node = @store.append(key, value)
      @map[key] = node

      value
    end
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
  end

  def update_node!(node)
    previous_node = node.prev
    next_node = node.next

    previous_node.next = next_node
    next_node.prev = previous_node

    @store.append(node.key, node.val)
  end

  def eject!
  end
end
