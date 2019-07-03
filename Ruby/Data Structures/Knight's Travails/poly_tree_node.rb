class PolyTreeNode
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    @parent
  end

  def parent=(node)
    return @parent = nil if node.nil?
    @parent.children.delete(self) if @parent && node
    @parent = node
    @parent.children << self
  end

  def children
    @children
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise "Not a valid child node." if !children.include?(child_node)
    child_node.parent = nil
  end

  def value
    @value
  end

  def dfs(target_value)
    return self if self.value == target_value
    
    self.children.each do |child_node|
      result = child_node.dfs(target_value)
      return result unless result.nil?
    end

    nil
  end

  def bfs(target_value)
    nodes = [self]
    
    until nodes.empty?
      node = nodes.shift
      return node if node.value == target_value
      nodes += node.children
    end
    
    nil
  end
end
