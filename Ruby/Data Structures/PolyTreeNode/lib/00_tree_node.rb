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
end
